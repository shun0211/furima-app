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

ActiveRecord::Schema.define(version: 20200411115009) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "postal_code",     null: false
    t.string   "prefectures",     null: false
    t.string   "municipality",    null: false
    t.string   "address",         null: false
    t.string   "building_name",   null: false
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "firstname"
    t.string   "familyname"
    t.string   "firstname_kana"
    t.string   "familyname_kana"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category",   null: false
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.string   "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "card_id",     null: false
    t.string   "customer_id", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id", using: :btree
  end

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "evaluation",                       null: false
    t.integer  "user_id",                          null: false
    t.text     "evaluation_comment", limit: 65535
    t.integer  "item_id",                          null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["item_id"], name: "index_evaluations_on_item_id", using: :btree
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "product_name",                      null: false
    t.text     "product_information", limit: 65535, null: false
    t.string   "product_status",                    null: false
    t.integer  "price",                             null: false
    t.string   "product_condition",                 null: false
    t.integer  "shipping_charge",                   null: false
    t.string   "days_of_ship",                      null: false
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.string   "brand"
    t.string   "size"
    t.integer  "category_id",                       null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "prefecture_id"
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id", using: :btree
    t.index ["product_name"], name: "index_items_on_product_name", using: :btree
    t.index ["seller_id"], name: "index_items_on_seller_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",      null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_product_images_on_item_id", using: :btree
  end

  create_table "purchase_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_purchase_histories_on_item_id", using: :btree
    t.index ["user_id"], name: "index_purchase_histories_on_user_id", using: :btree
  end

  create_table "sell_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_sell_histories_on_item_id", using: :btree
    t.index ["user_id"], name: "index_sell_histories_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: ""
    t.string   "encrypted_password",                   default: ""
    t.string   "firstname",                                         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "familyname",                                        null: false
    t.string   "firstname_kana",                                    null: false
    t.string   "familyname_kana",                                   null: false
    t.integer  "phone_number"
    t.string   "profile_image"
    t.string   "nickname"
    t.text     "profile_text",           limit: 65535
    t.integer  "birth_year",                                        null: false
    t.integer  "birth_month",                                       null: false
    t.integer  "birth_day",                                         null: false
    t.integer  "credit_card_id"
    t.index ["credit_card_id"], name: "index_users_on_credit_card_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "evaluations", "items"
  add_foreign_key "evaluations", "users"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "product_images", "items"
  add_foreign_key "purchase_histories", "items"
  add_foreign_key "purchase_histories", "users"
  add_foreign_key "sell_histories", "items"
  add_foreign_key "sell_histories", "users"
  add_foreign_key "users", "credit_cards"
end
