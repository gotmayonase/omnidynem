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

ActiveRecord::Schema.define(version: 20140910214521) do

  create_table "certification_outputs", force: true do |t|
    t.integer "certification_id"
    t.integer "recipe_id"
  end

  add_index "certification_outputs", ["certification_id", "recipe_id"], name: "index_certification_outputs_on_certification_id_and_recipe_id", using: :btree

  create_table "certifications", force: true do |t|
    t.string   "name"
    t.string   "web_icon"
    t.integer  "xp"
    t.text     "description"
    t.integer  "cert_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certifications_yields", force: true do |t|
    t.integer "certification_id"
    t.integer "item_id"
  end

  add_index "certifications_yields", ["certification_id", "item_id"], name: "index_certifications_yields_on_certification_id_and_item_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",             default: 0, null: false
    t.integer  "attempts",             default: 0, null: false
    t.text     "handler",                          null: false
    t.text     "last_error"
    t.datetime "run_at",     limit: 6
    t.datetime "locked_at",  limit: 6
    t.datetime "failed_at",  limit: 6
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "frame_restrictions", force: true do |t|
    t.integer  "frame_id"
    t.integer  "perk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frame_restrictions", ["frame_id"], name: "index_frame_restrictions_on_frame_id", using: :btree
  add_index "frame_restrictions", ["perk_id"], name: "index_frame_restrictions_on_perk_id", using: :btree

  create_table "frames", force: true do |t|
    t.string   "name"
    t.string   "thumb"
    t.string   "image"
    t.string   "text"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: true do |t|
    t.integer  "stack_size"
    t.string   "rarity"
    t.string   "web_icon_stem"
    t.string   "type"
    t.string   "name"
    t.integer  "required_level"
    t.integer  "item_level"
    t.integer  "sub_type_id"
    t.text     "description"
    t.string   "web_icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perks", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.integer  "level"
    t.integer  "frame_id"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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

  add_index "recipe_inputs", ["recipe_id", "item_id"], name: "index_recipe_inputs_on_recipe_id_and_item_id", using: :btree

  create_table "recipe_outputs", force: true do |t|
    t.integer "item_id"
    t.integer "recipe_id"
  end

  add_index "recipe_outputs", ["item_id", "recipe_id"], name: "index_recipe_outputs_on_item_id_and_recipe_id", using: :btree

  create_table "recipes", force: true do |t|
    t.integer  "blueprint_type_id"
    t.string   "name"
    t.boolean  "requires_all_certs"
    t.text     "description"
    t.integer  "subtype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "required_certifications", force: true do |t|
    t.integer "certification_id"
    t.integer "recipe_id"
  end

  add_index "required_certifications", ["certification_id", "recipe_id"], name: "index_required_certifications_on_certification_id_and_recipe_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
