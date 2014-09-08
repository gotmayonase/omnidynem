class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications, id: false do |t|
      t.integer :id, options: 'PRIMARY KEY', null: false
      t.string :name
      t.string :web_icon
      t.integer :xp
      t.text :description
      t.index :id

      t.timestamps
    end

    create_table :certification_outputs do |t|
      t.integer :certification_id
      t.integer :recipe_id
      t.index [:certification_id, :recipe_id]
    end

    create_table :required_certifications do |t|
      t.integer :certification_id
      t.integer :recipe_id
      t.index [:certification_id, :recipe_id]
    end
  end
end
