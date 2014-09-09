class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :stack_size
      t.string :rarity
      # "constraints": {
      #   "cpu": 0,
      #   "mass": 0,
      #   "power": 0
      # },
      # "certifications": null,
      t.string :web_icon_stem
      # "character_scalars": null,
      # "flags": {
      #   "resource": true
      # },
      t.string :type
      t.string :name
      t.integer :required_level
      t.integer :item_level
      t.integer :sub_type_id
      t.text :description
      t.string :web_icon

      t.timestamps
    end

    create_table :recipe_outputs do |t|
      t.integer :item_id
      t.integer :recipe_id
      t.index [:item_id, :recipe_id]
    end
  end
end
