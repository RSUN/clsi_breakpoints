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

ActiveRecord::Schema.define(version: 20150903014123) do

  create_table "breakpoints", force: :cascade do |t|
    t.string   "drug"
    t.integer  "s_maximum"
    t.integer  "r_minimum"
    t.string   "surrogate_drugs"
    t.string   "r_if_surrogate_is"
    t.string   "ni_if_surrogate_is"
    t.string   "r_if_blt_is"
    t.string   "delivery_mechanism"
    t.string   "infection_type"
    t.string   "footnote"
    t.string   "master_group_include"
    t.string   "organism_group_include"
    t.string   "viridans_group_include"
    t.string   "genus_include"
    t.string   "genus_exclude"
    t.string   "organism_code_include"
    t.string   "organism_code_exclude"
    t.string   "gram_include"
    t.string   "level_1_include"
    t.string   "level_3_include"
    t.string   "level_3_exclude"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "drugid"
  end

  create_table "isolates", force: :cascade do |t|
    t.integer  "isolate_id"
    t.integer  "collection"
    t.integer  "site"
    t.integer  "study_year"
    t.integer  "bank"
    t.string   "organism_code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "mics", force: :cascade do |t|
    t.integer  "isolate_id"
    t.integer  "drug_id"
    t.float    "value"
    t.integer  "edge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mics", ["drug_id"], name: "index_mics_on_drug_id"
  add_index "mics", ["isolate_id"], name: "index_mics_on_isolate_id"

  create_table "organisms", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "species"
    t.string   "sub_species"
    t.string   "organism_group"
    t.string   "master_group"
    t.string   "viridans_group"
    t.string   "level1"
    t.string   "level2"
    t.string   "level3"
    t.string   "level4"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "genus"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
