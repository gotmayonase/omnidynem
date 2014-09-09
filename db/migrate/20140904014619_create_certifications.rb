class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :web_icon
      t.integer :xp
      t.text :description
      t.integer :cert_type_id

      t.timestamps
    end

    create_table :certifications_yields do |t|
      t.integer :certification_id
      t.integer :item_id
      t.index [:certification_id, :item_id]
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
