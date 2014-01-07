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

ActiveRecord::Schema.define(version: 20140107105151) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state",          limit: 2
    t.string   "zip_code",       limit: 5
    t.integer  "user_id"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "invoices", force: true do |t|
    t.integer  "unique_id"
    t.datetime "due_date"
    t.decimal  "amount",     precision: 8, scale: 2
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id"

  create_table "opro_auth_grants", force: true do |t|
    t.string   "code"
    t.string   "access_token"
    t.string   "refresh_token"
    t.text     "permissions"
    t.datetime "access_token_expires_at"
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opro_auth_grants", ["access_token"], name: "index_opro_auth_grants_on_access_token", unique: true
  add_index "opro_auth_grants", ["code"], name: "index_opro_auth_grants_on_code", unique: true
  add_index "opro_auth_grants", ["refresh_token"], name: "index_opro_auth_grants_on_refresh_token", unique: true

  create_table "opro_client_apps", force: true do |t|
    t.string   "name"
    t.string   "app_id"
    t.string   "app_secret"
    t.text     "permissions"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opro_client_apps", ["app_id", "app_secret"], name: "index_opro_client_apps_on_app_id_and_app_secret", unique: true
  add_index "opro_client_apps", ["app_id"], name: "index_opro_client_apps_on_app_id", unique: true

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
