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

ActiveRecord::Schema.define(version: 20171003073325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "notifications", force: :cascade do |t|
    t.integer  "voter_id"
    t.text     "message"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notifications", ["voter_id"], name: "index_notifications_on_voter_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "options", ["poll_id"], name: "index_options_on_poll_id", using: :btree

  create_table "polls", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "voter_id"
    t.datetime "time_limit"
    t.datetime "end_time"
    t.boolean  "private",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "days"
    t.integer  "hours"
    t.string   "option_1"
    t.string   "option_2"
    t.string   "option_3"
    t.string   "option_4"
    t.string   "option_5"
    t.boolean  "ended",      default: false
  end

  add_index "polls", ["voter_id"], name: "index_polls_on_voter_id", using: :btree

  create_table "voters", force: :cascade do |t|
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
    t.string   "username"
    t.string   "ip_address"
  end

  add_index "voters", ["email"], name: "index_voters_on_email", unique: true, using: :btree
  add_index "voters", ["reset_password_token"], name: "index_voters_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "poll_id"
    t.integer  "voter_id"
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["option_id"], name: "index_votes_on_option_id", using: :btree
  add_index "votes", ["poll_id"], name: "index_votes_on_poll_id", using: :btree
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id", using: :btree

end
