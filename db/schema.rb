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

ActiveRecord::Schema.define(version: 20140107133114) do

  create_table "course_event_candidates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "candidate_id"
    t.float    "cost",             default: 0.0, null: false
    t.integer  "cost_currency_id"
  end

  create_table "course_events", force: true do |t|
    t.date     "start_date",    null: false
    t.date     "end_date",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_id"
    t.integer  "instructor_id"
  end

  create_table "course_masters", force: true do |t|
    t.string   "code",          limit: 8,                null: false
    t.string   "title",         limit: 80,               null: false
    t.float    "duration",                 default: 1.0
    t.integer  "min_candidate",            default: 3
    t.integer  "max_candidate",            default: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_currencies", force: true do |t|
    t.string   "short_code",  limit: 3
    t.string   "description", limit: 35
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_candidates", force: true do |t|
    t.integer  "master_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_instructors", force: true do |t|
    t.integer  "master_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_masters", force: true do |t|
    t.string   "family_name", limit: 35, default: "", null: false
    t.string   "given_name",  limit: 35, default: "", null: false
    t.string   "other_names", limit: 35, default: "", null: false
    t.string   "sex",         limit: 1
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
