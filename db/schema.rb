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

ActiveRecord::Schema.define(version: 20140819031944) do

  create_table "cities", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string "iso"
    t.string "name"
  end

  create_table "members", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_id"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender",     limit: 10
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "city"
    t.integer  "height"
    t.integer  "weight"
    t.string   "complexion"
  end

  create_table "photos", force: true do |t|
    t.integer  "member_id"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string  "name"
    t.integer "country_id"
    t.string  "iso"
  end

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_old", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname",              limit: 60
    t.string   "lastname",               limit: 60
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "city_id",                limit: 60
  end

  add_index "users_old", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users_old", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
