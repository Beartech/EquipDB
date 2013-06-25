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

ActiveRecord::Schema.define(version: 20130624215522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parts", force: true do |t|
    t.string   "name"
    t.string   "sku"
    t.integer  "tool_id"
    t.decimal  "price"
    t.string   "po"
    t.integer  "repair_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parts", ["repair_id"], name: "index_parts_on_repair_id", using: :btree
  add_index "parts", ["service_id"], name: "index_parts_on_service_id", using: :btree
  add_index "parts", ["tool_id"], name: "index_parts_on_tool_id", using: :btree

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

  create_table "services", force: true do |t|
    t.string   "name"
    t.date     "due_date"
    t.date     "completed"
    t.integer  "tool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "condition"
    t.text     "station"
    t.text     "apparatus"
  end

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
