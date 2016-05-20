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

ActiveRecord::Schema.define(version: 20160517203022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "media_files", force: :cascade do |t|
    t.bigint   "tweet_id",   null: false
    t.string   "link",       null: false
    t.string   "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type"], name: "index_media_files_on_media_type", using: :btree
    t.index ["tweet_id"], name: "index_media_files_on_tweet_id", using: :btree
  end

  create_table "tweets", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.bigint   "tweet_id",   null: false
    t.bigint   "twitter_id", null: false
    t.string   "link",       null: false
    t.string   "text"
    t.string   "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_type"], name: "index_tweets_on_media_type", using: :btree
    t.index ["tweet_id"], name: "index_tweets_on_tweet_id", unique: true, using: :btree
    t.index ["twitter_id"], name: "index_tweets_on_twitter_id", using: :btree
    t.index ["user_id"], name: "index_tweets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "",                                                                                 null: false
    t.integer  "sign_in_count",      default: 0,                                                                                  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "screen_name",                                                                                                     null: false
    t.bigint   "twitter_id",                                                                                                      null: false
    t.string   "name",               default: "A bird",                                                                           null: false
    t.string   "profile_img",        default: "https://abs.twimg.com/sticky/default_profile_images/default_profile_6_normal.png", null: false
    t.integer  "admin",              default: 0,                                                                                  null: false
    t.datetime "created_at",                                                                                                      null: false
    t.datetime "updated_at",                                                                                                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["screen_name"], name: "index_users_on_screen_name", unique: true, using: :btree
    t.index ["twitter_id"], name: "index_users_on_twitter_id", unique: true, using: :btree
  end

end
