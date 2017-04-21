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

ActiveRecord::Schema.define(version: 20170421041208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.float    "value"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_at"
    t.index ["item_id"], name: "index_auctions_on_item_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "bid_amount"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "auction_id"
    t.float    "value"
    t.index ["auction_id"], name: "index_bids_on_auction_id", using: :btree
    t.index ["item_id"], name: "index_bids_on_item_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "starting_price"
    t.datetime "end_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text    "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.boolean "read",            default: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "auctions", "items"
  add_foreign_key "bids", "auctions"
  add_foreign_key "bids", "items"
  add_foreign_key "bids", "users"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "items", "users"
end
