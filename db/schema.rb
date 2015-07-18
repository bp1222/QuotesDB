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

ActiveRecord::Schema.define(version: 20150718000702) do

  create_table "quotes", force: :cascade do |t|
    t.text     "quote"
    t.integer  "vote"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "attributed_id"
    t.integer  "author_id"
  end

  add_index "quotes", ["attributed_id"], name: "index_quotes_on_attributed_id"
  add_index "quotes", ["author_id"], name: "index_quotes_on_author_id"

  create_table "rights", force: :cascade do |t|
    t.string   "right_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rights_roles", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "right_id"
  end

  add_index "rights_roles", ["right_id"], name: "index_rights_roles_on_right_id"
  add_index "rights_roles", ["role_id"], name: "index_rights_roles_on_role_id"

  create_table "roles", force: :cascade do |t|
    t.string   "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
