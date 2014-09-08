class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :type
      t.string :name
      t.text :description
      t.integer :cost
      t.integer :level
      t.integer :frame_id
      t.string :image

      t.timestamps null: false
    end
  end
end
