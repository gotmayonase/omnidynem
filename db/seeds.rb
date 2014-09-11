frames = JSON.parse(File.read(File.join(Rails.root,'lib','import','frames.json')))

pbar = ProgressBar.create(title: 'Frames', total: frames.count)
frames.each do |frame_hash|
  frame = Frame.find_or_create_by(name: frame_hash["name"])
  frame.attributes = frame_hash
  frame.save

  pbar.increment
end
pbar.finish

perks = JSON.parse(File.read(File.join(Rails.root,'lib','import','perks.json')))

pbar = ProgressBar.create(title: 'Perks', total: perks.count)
perks.each do |perk_hash|
  perk = Perk.find_or_create_by(name: perk_hash["name"])

  frame = perk_hash.delete("frame")
  perk.unlocking_frame = Frame.find_by(name: frame) if frame

  restrictions = perk_hash.delete("restrictions")
  restricted_frames = Frame.where(name: restrictions)
  perk.restricted_frames = restricted_frames

  tags = perk_hash.delete("tags")
  perk.tag_list.add(tags)

  desc = perk_hash.delete("desc")

  perk.description = desc
  perk.attributes = perk_hash

  perk.save
  pbar.increment
end
pbar.finish
