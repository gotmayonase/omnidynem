class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes, id: false do |t|
      t.integer :id, options: 'PRIMARY KEY', null: false
      t.index :id
      t.integer :blueprint_type_id
      t.string :name
      t.boolean :requires_all_certs
      t.text :description
      t.integer :subtype_id

      t.timestamps
    end
  end
end
