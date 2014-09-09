class CreateRecipeInputs < ActiveRecord::Migration
  def change
    create_table :recipe_inputs do |t|
      t.integer :material_type_id
      t.integer :quantity
      t.boolean :required
      t.integer :item_id
      t.integer :resource_type_id
      t.boolean :unlimited
      t.integer :output_index
      t.integer :recipe_id
      t.index [:recipe_id, :item_id]

      t.timestamps
    end
  end
end
