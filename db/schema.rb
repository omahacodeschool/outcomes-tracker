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

ActiveRecord::Schema.define(version: 20160809190101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.integer  "school_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer "ability_id"
    t.integer "user_id"
  end

  add_index "permissions", ["ability_id"], name: "index_permissions_on_ability_id", using: :btree
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "github_username"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "image_url"
  end

end
