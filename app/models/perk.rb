class Perk < ActiveRecord::Base

  belongs_to :unlocking_frame, class_name: 'Frame'
  has_many :frame_restrictions
  has_many :restricted_frames, through: :frame_restrictions, class_name: 'Frame'

end
