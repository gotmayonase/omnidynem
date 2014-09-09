class Frame < ActiveRecord::Base

  has_many :frame_restrictions
  has_many :restricted_perks, through: :frame_restrictions, class_name: 'Perk'

end
