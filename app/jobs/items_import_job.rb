class ItemsImportJob < ActiveJob::Base

  queue_as :items_import

  def perform(filepath)
    json_data = File.read(filepath)
    json = JSON.parse(json_data).first
    pbar = ProgressBar.create(title: 'Items', total: json.count)
    json.each do |id, data|
      if item = Item.find_by(id: id)
        update_item(item, data)
      else
        insert_item(id, data)
      end
      pbar.increment
    end
    pbar.finish
  end

  private

    def insert_item(id, data)
      item = Item.new
      item.id = id
      update_item(item, data)
    end

    def update_item(item, data)
      data = Hash[data.map { |k,v| [k.to_s.underscore, v]}]

      # don't know what to do with these yet
      constraints = data.delete("constraints")
      flags = data.delete("flags")
      character_scalars = data.delete("character_scalars")
      tier = data.delete("tier")
      certifications = data.delete("certifications")
      item_type_id = data.delete("item_type_id")
      icon_id = data.delete("icon_id")
      resource_color = data.delete("resource_color")
      # end unused data

      item.attributes = data
      item.save
    end

end
