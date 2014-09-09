class CreateFrameRestrictions < ActiveRecord::Migration
  def change
    create_table :frame_restrictions do |t|
      t.belongs_to :frame, index: true
      t.belongs_to :perk, index: true

      t.timestamps null: false
    end
  end
end
