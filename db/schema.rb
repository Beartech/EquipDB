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

ActiveRecord::Schema.define(version: 20140213184126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dev_logs", force: true do |t|
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dev_logs", ["user_id"], name: "index_dev_logs_on_user_id", using: :btree

  create_table "dropdowns", force: true do |t|
    t.text     "name"
    t.text     "list"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "type"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.boolean  "vehicle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "type"
  end

  create_table "part_aliases", force: true do |t|
    t.string   "sku"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "part_aliases", ["part_id"], name: "index_part_aliases_on_part_id", using: :btree

  create_table "parts", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inventory"
    t.integer  "minimum"
    t.integer  "maximum"
  end

  create_table "parts_service_types", id: false, force: true do |t|
    t.integer "service_type_id", null: false
    t.integer "part_id",         null: false
  end

  create_table "repairs", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "tool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repairs", ["tool_id"], name: "index_repairs_on_tool_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.float    "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.date     "due_date"
    t.date     "completed"
    t.integer  "tool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_type_id"
    t.text     "note"
  end

  add_index "services", ["tool_id"], name: "index_services_on_tool_id", using: :btree

  create_table "tools", force: true do |t|
    t.string   "name"
    t.string   "serial"
    t.date     "purchased"
    t.date     "put_in_service"
    t.decimal  "cost"
    t.decimal  "value"
    t.boolean  "in_service"
    t.date     "retired"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.string   "condition"
    t.text     "old_location"
    t.string   "model"
    t.boolean  "loaner",         default: false
    t.integer  "location_id"
    t.integer  "category_id"
  end

  add_index "tools", ["category_id"], name: "index_tools_on_category_id", using: :btree
  add_index "tools", ["location_id"], name: "index_tools_on_location_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

end
