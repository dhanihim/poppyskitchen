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

ActiveRecord::Schema.define(version: 2021_09_20_025815) do

  create_table "ordered_products", force: :cascade do |t|
    t.integer "price"
    t.integer "profit"
    t.integer "total"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "scheduled_product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.index ["order_id"], name: "index_ordered_products_on_order_id"
    t.index ["scheduled_product_id"], name: "index_ordered_products_on_scheduled_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.integer "visitor_id"
    t.string "key"
    t.index ["visitor_id"], name: "index_orders_on_visitor_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.integer "cost"
    t.integer "price"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scheduled_products", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product_id"
    t.integer "schedule_id"
    t.index ["product_id"], name: "index_scheduled_products_on_product_id"
    t.index ["schedule_id"], name: "index_scheduled_products_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "dateopen"
    t.date "dateclose"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "datedelivery"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
