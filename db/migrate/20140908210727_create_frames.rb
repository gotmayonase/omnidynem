class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :name
      t.string :thumb
      t.string :image
      t.string :text
      t.string :type

      t.timestamps null: false
    end
  end
end
