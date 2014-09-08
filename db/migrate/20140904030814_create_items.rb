class CreateItems < ActiveRecord::Migration
  def change
    create_table :items, id: false do |t|
      t.integer :id, options: 'PRIMARY KEY', null: false
      t.string :name
      t.text :description
      t.integer :ability_id
      t.integer :icon_id
      t.integer :level
      t.string :module_type
      t.integer :power_level
      t.string :quality
      t.string :type
      t.string :web_icon
      t.index :id

      t.timestamps
    end

    create_table :recipe_outputs do |t|
      t.integer :item_id
      t.integer :recipe_id
      t.index [:item_id, :recipe_id]
    end
  end
end
