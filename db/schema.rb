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

ActiveRecord::Schema.define(version: 20130903082632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "background_informations", force: true do |t|
    t.text     "elevator_pitch"
    t.text     "background_information"
    t.text     "no_list"
    t.text     "what_can_go_wrong"
    t.text     "what_is_it_going_to_give"
    t.text     "what_is_the_frame"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "background_informations", ["request_id"], name: "index_background_informations_on_request_id", using: :btree

  create_table "elevator_pitches", force: true do |t|
    t.text     "text"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elevator_pitches", ["request_id"], name: "index_elevator_pitches_on_request_id", using: :btree

  create_table "feature_requests", force: true do |t|
    t.integer  "user_id"
    t.text     "user_story"
    t.integer  "priority"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feature_requests", ["request_id"], name: "index_feature_requests_on_request_id", using: :btree
  add_index "feature_requests", ["user_id"], name: "index_feature_requests_on_user_id", using: :btree

  create_table "features", force: true do |t|
    t.integer  "request_id"
    t.text     "text"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "features", ["request_id"], name: "index_features_on_request_id", using: :btree

  create_table "price_quotes", force: true do |t|
    t.integer  "user_id"
    t.integer  "request_id"
    t.float    "price"
    t.float    "hours_estimated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
    t.string   "status"
  end

  add_index "price_quotes", ["request_id"], name: "index_price_quotes_on_request_id", using: :btree
  add_index "price_quotes", ["user_id"], name: "index_price_quotes_on_user_id", using: :btree

  create_table "request_groups", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_groups_users", force: true do |t|
    t.integer "user_id"
    t.integer "request_group_id"
  end

  create_table "requests", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "goal"
    t.integer  "request_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "contractor_id"
    t.text     "elevator_pitch"
    t.text     "background_information"
    t.text     "no_list"
    t.text     "what_can_go_wrong"
    t.text     "what_is_it_going_to_give"
    t.text     "what_is_the_frame"
    t.boolean  "published"
    t.integer  "delegated_to_user_id"
  end

  add_index "requests", ["request_group_id"], name: "index_requests_on_request_group_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.text     "bio"
    t.string   "image_url"
    t.string   "title"
    t.string   "name"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
