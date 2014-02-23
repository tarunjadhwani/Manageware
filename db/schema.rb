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

ActiveRecord::Schema.define(version: 20140223161846) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["name"], name: "index_customers_on_name", unique: true

  create_table "drawing_reports", force: true do |t|
    t.integer  "revision_no"
    t.string   "list_of_drawing"
    t.string   "issue_drawing"
    t.boolean  "copy"
    t.date     "date_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "payment_schedules", force: true do |t|
    t.string   "status"
    t.integer  "amount"
    t.date     "payment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "site_visits", force: true do |t|
    t.string   "work_completed"
    t.date     "visit_date"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "work_orders", force: true do |t|
    t.integer  "area"
    t.string   "payment_type"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "work_schedules", force: true do |t|
    t.string   "task_work"
    t.integer  "duration"
    t.date     "start_date"
    t.date     "finish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

end
