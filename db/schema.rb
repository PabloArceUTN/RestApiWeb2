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

ActiveRecord::Schema.define(version: 20160317232334) do

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.boolean  "active"
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "transfers", force: :cascade do |t|
    t.integer  "product_req_id",   limit: 4
    t.integer  "product_offer_id", limit: 4
    t.boolean  "active"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "transfers", ["product_offer_id"], name: "fk_rails_8d607ad088", using: :btree
  add_index "transfers", ["product_req_id"], name: "fk_rails_e001a2452a", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "firstname",  limit: 255
    t.string   "token",      limit: 255
    t.datetime "valid_up"
    t.boolean  "active"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "products", "users"
  add_foreign_key "transfers", "products", column: "product_offer_id"
  add_foreign_key "transfers", "products", column: "product_req_id"
end
