# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_08_151019) do
  create_table "item_part_attribute_options", force: :cascade do |t|
    t.integer "item_part_attribute_id", null: false
    t.string "name"
    t.decimal "price"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_part_attribute_id"], name: "index_item_part_attribute_options_on_item_part_attribute_id"
  end

  create_table "item_part_attributes", force: :cascade do |t|
    t.integer "item_part_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_part_id"], name: "index_item_part_attributes_on_item_part_id"
  end

  create_table "item_parts", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "name"
    t.text "description"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_parts_on_item_id"
    t.index ["parent_id"], name: "index_item_parts_on_parent_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "item_part_attribute_options", "item_part_attributes"
  add_foreign_key "item_part_attributes", "item_parts"
  add_foreign_key "item_parts", "item_parts", column: "parent_id"
  add_foreign_key "item_parts", "items"
end
