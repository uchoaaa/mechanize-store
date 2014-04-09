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

ActiveRecord::Schema.define(version: 20140409191457) do

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
  end

  add_index "mechanize_store_freights", ["order_id"], name: "index_mechanize_store_freights_on_order_id"

  create_table "mechanize_store_order_items", force: true do |t|
    t.integer  "quantity"
    t.float    "price"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanize_store_order_items", ["order_id"], name: "index_mechanize_store_order_items_on_order_id"
  add_index "mechanize_store_order_items", ["product_id"], name: "index_mechanize_store_order_items_on_product_id"

  create_table "mechanize_store_order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mechanize_store_orders", force: true do |t|
    t.integer  "order_status_id"
    t.integer  "store_id"
    t.datetime "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanize_store_orders", ["order_status_id"], name: "index_mechanize_store_orders_on_order_status_id"
  add_index "mechanize_store_orders", ["store_id"], name: "index_mechanize_store_orders_on_store_id"

  create_table "mechanize_store_payment_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mechanize_store_payment_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mechanize_store_payments", force: true do |t|
    t.integer  "payable_id"
    t.string   "payable_type"
    t.integer  "payment_status_id"
    t.float    "value"
    t.float    "paid_value"
    t.datetime "paid_in"
    t.integer  "plot"
    t.integer  "flag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanize_store_payments", ["flag_id"], name: "index_mechanize_store_payments_on_flag_id"
  add_index "mechanize_store_payments", ["payment_status_id"], name: "index_mechanize_store_payments_on_payment_status_id"

  create_table "mechanize_store_product_categories", force: true do |t|
    t.string   "name"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "mechanize_store_products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "short_description"
    t.float    "price"
    t.float    "weight"
    t.float    "lenght"
    t.float    "height"
    t.integer  "product_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "width"
  end

  add_index "mechanize_store_products", ["product_category_id"], name: "index_mechanize_store_products_on_product_category_id"

end
