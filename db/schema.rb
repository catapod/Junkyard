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

ActiveRecord::Schema.define(version: 20170601135440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chunk_types", force: :cascade do |t|
    t.string "name",         null: false
    t.string "display_name", null: false
  end

  create_table "chunks", force: :cascade do |t|
    t.integer  "material_id"
    t.integer  "material_position", null: false
    t.integer  "chunk_type_id"
    t.boolean  "translatable",      null: false
    t.text     "body",              null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["chunk_type_id"], name: "index_chunks_on_chunk_type_id", using: :btree
    t.index ["material_id"], name: "index_chunks_on_material_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "chunk_id"
    t.integer  "commentator_id"
    t.text     "body",           null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["chunk_id"], name: "index_comments_on_chunk_id", using: :btree
    t.index ["commentator_id"], name: "index_comments_on_commentator_id", using: :btree
  end

  create_table "licenses", force: :cascade do |t|
    t.string "name",    null: false
    t.string "link"
    t.text   "content", null: false
  end

  create_table "material_tags", force: :cascade do |t|
    t.string "name",         null: false
    t.string "display_name", null: false
    t.json   "body",         null: false
  end

  create_table "material_tags_materials", force: :cascade do |t|
    t.integer "material_id"
    t.integer "material_tag_id"
    t.index ["material_id"], name: "index_material_tags_materials_on_material_id", using: :btree
    t.index ["material_tag_id"], name: "index_material_tags_materials_on_material_tag_id", using: :btree
  end

  create_table "materials", force: :cascade do |t|
    t.integer  "rightholder_id"
    t.integer  "owner_id"
    t.string   "original_link"
    t.string   "caption_original",      null: false
    t.string   "caption_translated"
    t.text     "annotation_original",   null: false
    t.text     "annotation_translated"
    t.integer  "state_id"
    t.integer  "license_id"
    t.string   "original_language",     null: false
    t.string   "translation_language",  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["license_id"], name: "index_materials_on_license_id", using: :btree
    t.index ["owner_id"], name: "index_materials_on_owner_id", using: :btree
    t.index ["rightholder_id"], name: "index_materials_on_rightholder_id", using: :btree
    t.index ["state_id"], name: "index_materials_on_state_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "value",          null: false
    t.integer  "translation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
    t.index ["translation_id"], name: "index_rates_on_translation_id", using: :btree
  end

  create_table "rightholders", force: :cascade do |t|
    t.string "caption_original",   null: false
    t.string "caption_translated"
    t.string "short_original",     null: false
    t.string "short_translated"
    t.string "link"
    t.string "icon"
  end

  create_table "states", force: :cascade do |t|
    t.string "name",         null: false
    t.string "display_name", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.integer  "chunk_id"
    t.integer  "translator_id"
    t.text     "body",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["chunk_id"], name: "index_translations_on_chunk_id", using: :btree
    t.index ["translator_id"], name: "index_translations_on_translator_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname",   null: false
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "users", column: "commentator_id"
  add_foreign_key "materials", "users", column: "owner_id"
  add_foreign_key "rates", "users", column: "rater_id"
  add_foreign_key "translations", "users", column: "translator_id"
end
