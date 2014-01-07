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

ActiveRecord::Schema.define(version: 20140102095042) do

  create_table "course_event_candidates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "candidate_id"
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
    t.string   "family_name", limit: 35, null: false, default: ''
    t.string   "given_name",  limit: 35, null: false, default: ''
    t.string   "other_names", limit: 35, null: false, default: ''
    t.string   "sex",         limit: 1
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
