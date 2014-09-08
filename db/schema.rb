# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140904030814) do

  create_table "certification_outputs", force: true do |t|
    t.integer "certification_id"
    t.integer "recipe_id"
  end

  add_index "certification_outputs", ["certification_id", "recipe_id"], name: "index_certification_outputs_on_certification_id_and_recipe_id", using: :btree

  create_table "certifications", id: false, force: true do |t|
    t.integer  "id",          null: false
    t.string   "name"
    t.string   "web_icon"
    t.integer  "xp"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "certifications", ["id"], name: "index_certifications_on_id", using: :btree

  create_table "items", id: false, force: true do |t|
    t.integer  "id",          null: false
    t.string   "name"
    t.text     "description"
    t.integer  "ability_id"
    t.integer  "icon_id"
    t.integer  "level"
    t.string   "module_type"
    t.integer  "power_level"
    t.string   "quality"
    t.string   "type"
    t.string   "web_icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["id"], name: "index_items_on_id", using: :btree

  create_table "recipe_inputs", force: true do |t|
    t.integer  "material_type_id"
    t.integer  "quantity"
    t.boolean  "required"
    t.integer  "item_id"
    t.integer  "resource_type_id"
    t.boolean  "unlimited"
    t.integer  "output_index"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_inputs", ["id"], name: "index_recipe_inputs_on_id", using: :btree
  add_index "recipe_inputs", ["recipe_id", "item_id"], name: "index_recipe_inputs_on_recipe_id_and_item_id", using: :btree

  create_table "recipe_outputs", force: true do |t|
    t.integer "item_id"
    t.integer "recipe_id"
  end

  add_index "recipe_outputs", ["item_id", "recipe_id"], name: "index_recipe_outputs_on_item_id_and_recipe_id", using: :btree

  create_table "recipes", id: false, force: true do |t|
    t.integer  "id",                 null: false
    t.integer  "blueprint_type_id"
    t.string   "name"
    t.boolean  "requires_all_certs"
    t.text     "description"
    t.integer  "subtype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["id"], name: "index_recipes_on_id", using: :btree

  create_table "required_certifications", force: true do |t|
    t.integer "certification_id"
    t.integer "recipe_id"
  end

  add_index "required_certifications", ["certification_id", "recipe_id"], name: "index_required_certifications_on_certification_id_and_recipe_id", using: :btree

end
