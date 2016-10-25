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

ActiveRecord::Schema.define(version: 20161025184356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.integer  "school_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  add_index "entries", ["company_id"], name: "index_entries_on_company_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "entry_id"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "events", ["entry_id"], name: "index_events_on_entry_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "hidings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hidings", ["company_id"], name: "index_hidings_on_company_id", using: :btree
  add_index "hidings", ["user_id"], name: "index_hidings_on_user_id", using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.string   "location"
    t.string   "job_title"
    t.boolean  "remote"
    t.string   "posting_url"
    t.string   "company_contact"
    t.text     "notes"
    t.date     "date_due"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "nature_of_employment"
    t.integer  "entry_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "job_title"
    t.string   "location"
    t.boolean  "remote"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "entry_id"
    t.integer  "nature_of_employment"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ability"
  end

  add_index "permissions", ["user_id"], name: "index_permissions_on_user_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "job_title"
    t.string   "location"
    t.boolean  "remote"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "entry_id"
    t.integer  "nature_of_employment"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cohort_id"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "race"
    t.string   "ethnicity"
    t.boolean  "military"
    t.boolean  "disability"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "resume"
    t.string   "personal_website"
    t.string   "linked_in"
    t.string   "twitter"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree

  create_table "salaries", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "rate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position_id"
    t.integer  "offer_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "institution_code"
    t.integer  "campus_location"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "translations", force: :cascade do |t|
    t.integer "user_id"
    t.string  "input_text",                            null: false
    t.string  "output_text",  limit: 106
    t.string  "project_name",             default: "", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "github_username", null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "image_url"
    t.datetime "last_active_at"
    t.string   "slack_username"
  end

  add_foreign_key "entries", "companies"
  add_foreign_key "events", "entries"
  add_foreign_key "events", "users"
  add_foreign_key "hidings", "companies"
  add_foreign_key "hidings", "users"
end
