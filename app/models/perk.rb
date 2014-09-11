class Perk < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :unlocking_frame, class_name: 'Frame', foreign_key: :frame_id
  has_many :frame_restrictions
  has_many :restricted_frames, through: :frame_restrictions, source: :frame

  acts_as_taggable

end
