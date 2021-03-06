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

ActiveRecord::Schema.define(version: 20160826021332) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.string   "zip_code"
    t.integer  "ddd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "min_users"
    t.integer  "max_users"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "short_description"
    t.string   "long_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "title"
    t.string   "short_description"
    t.string   "long_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "short_description"
    t.text     "long_description"
    t.integer  "city_id"
    t.string   "address"
    t.string   "address_complement"
    t.string   "number"
    t.string   "district"
    t.string   "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "url_site"
    t.string   "facebook_page"
    t.date     "initial_date"
    t.date     "end_date"
    t.time     "initial_hour"
    t.time     "end_hour"
    t.string   "status"
    t.text     "note"
    t.boolean  "archive"
    t.integer  "event_type_id"
    t.integer  "event_category_id"
    t.boolean  "use_password"
    t.string   "password"
    t.string   "confirm_password"
    t.integer  "min_users"
    t.integer  "max_users"
    t.integer  "company_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "invitation_types", force: :cascade do |t|
    t.string   "title"
    t.string   "short_description"
    t.text     "long_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "guest_user_id"
    t.integer  "invitation_type_id"
    t.integer  "host_user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_company_types", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "user_type_id"
    t.boolean  "active"
    t.boolean  "admin"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "title"
    t.string   "short_description"
    t.text     "long_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "last_name"
    t.string   "long_name"
    t.date     "birth_date"
    t.string   "genre"
    t.string   "phone_number"
    t.string   "token"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "active"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
