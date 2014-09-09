class FrameRestriction < ActiveRecord::Base
  belongs_to :frame
  belongs_to :perk
end
