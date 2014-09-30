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

ActiveRecord::Schema.define(version: 20140930183601) do

  create_table "mechanize_store_admins", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanize_store_admins", ["email"], name: "index_mechanize_store_admins_on_email", unique: true
  add_index "mechanize_store_admins", ["reset_password_token"], name: "index_mechanize_store_admins_on_reset_password_token", unique: true

  create_table "mechanize_store_flags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mechanize_store_freights", force: true do |t|
    t.float    "value"
    t.string   "service"
    t.integer  "order_id"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_time"
    t.integer  "freight_type"
  end

  add_index "mechanize_store_freights", ["order_id"], name: "index_mechanize_store_freights_on_order_id"

  create_table "mechanize_store_managers", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanize_store_managers", ["email"], name: "index_mechanize_store_managers_on_email", unique: true
  add_index "mechanize_store_managers", ["reset_password_token"], name: "index_mechanize_store_managers_on_reset_password_token", unique: true

  create_table "mechanize_store_order_items", force: true do |t|
    t.integer  "quantity"
    t.float    "price"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.string   "size"
  end

  add_index "mechanize_store_order_items", ["order_id"], name: "index_mechanize_store_order_items_on_order_id"
  add_index "mechanize_store_order_items", ["product_id"], name: "index_mechanize_store_order_items_on_product_id"

  create_table "mechanize_store_orders", force: true do |t|
    t.integer  "order_status"
    t.integer  "store_id"
    t.datetime "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanize_store_orders", ["order_status"], name: "index_mechanize_store_orders_on_order_status"
  add_index "mechanize_store_orders", ["store_id"], name: "index_mechanize_store_orders_on_store_id"

  create_table "mechanize_store_payments", force: true do |t|
    t.integer  "order_id"
    t.integer  "payment_status"
    t.float    "value"
    t.float    "paid_value"
    t.datetime "paid_in"
    t.integer  "plot"
    t.integer  "flag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_type"
  end

  add_index "mechanize_store_payments", ["flag_id"], name: "index_mechanize_store_payments_on_flag_id"
  add_index "mechanize_store_payments", ["payment_status"], name: "index_mechanize_store_payments_on_payment_status"
  add_index "mechanize_store_payments", ["payment_type"], name: "index_mechanize_store_payments_on_payment_type"

  create_table "mechanize_store_product_categories", force: true do |t|
    t.string   "name"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "product_section_id"
  end

  create_table "mechanize_store_product_photos", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanize_store_product_photos", ["product_id"], name: "index_mechanize_store_product_photos_on_product_id"

  create_table "mechanize_store_product_sections", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "mechanize_store_products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "short_description"
    t.float    "price"
    t.float    "weight"
    t.float    "length"
    t.float    "height"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "width"
    t.string   "slug"
  end

  add_index "mechanize_store_products", ["product_category_id"], name: "index_mechanize_store_products_on_product_category_id"

end
