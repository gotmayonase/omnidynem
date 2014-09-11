class Frame < ActiveRecord::Base
  self.inheritance_column = nil
  has_many :frame_restrictions
  has_many :restricted_perks, through: :frame_restrictions, class_name: 'Perk'

end
