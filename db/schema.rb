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

ActiveRecord::Schema[8.0].define(version: 2025_05_07_153830) do
  create_table "incompatibility_rules", force: :cascade do |t|
    t.integer "attribute_a_id", null: false
    t.integer "attribute_b_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_a_id"], name: "index_incompatibility_rules_on_attribute_a_id"
    t.index ["attribute_b_id"], name: "index_incompatibility_rules_on_attribute_b_id"
  end

  create_table "item_parts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id", null: false
    t.integer "parent_id"
    t.index ["item_id"], name: "index_item_parts_on_item_id"
    t.index ["parent_id"], name: "index_item_parts_on_parent_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "part_attributes", force: :cascade do |t|
    t.integer "item_part_id", null: false
    t.string "name"
    t.decimal "price"
    t.boolean "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_part_id"], name: "index_part_attributes_on_item_part_id"
  end

  create_table "price_rules", force: :cascade do |t|
    t.integer "part_attribute_id", null: false
    t.integer "dependency_part_attribute_id", null: false
    t.string "operator", null: false
    t.decimal "price_adjustment", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependency_part_attribute_id"], name: "index_price_rules_on_dependency_part_attribute_id"
    t.index ["part_attribute_id"], name: "index_price_rules_on_part_attribute_id"
  end

  add_foreign_key "incompatibility_rules", "part_attributes", column: "attribute_a_id"
  add_foreign_key "incompatibility_rules", "part_attributes", column: "attribute_b_id"
  add_foreign_key "item_parts", "item_parts", column: "parent_id"
  add_foreign_key "item_parts", "items"
  add_foreign_key "part_attributes", "item_parts"
  add_foreign_key "price_rules", "part_attributes"
  add_foreign_key "price_rules", "part_attributes", column: "dependency_part_attribute_id"
end
