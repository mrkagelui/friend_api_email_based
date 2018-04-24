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

ActiveRecord::Schema.define(version: 20180424123013) do

  create_table "blockades", force: :cascade do |t|
    t.string "blocker"
    t.string "blockee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blockee"], name: "index_blockades_on_blockee"
    t.index ["blocker", "blockee"], name: "index_blockades_on_blocker_and_blockee", unique: true
  end

  create_table "followings", force: :cascade do |t|
    t.string "source"
    t.string "audience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source", "audience"], name: "index_followings_on_source_and_audience", unique: true
    t.index ["source"], name: "index_followings_on_source"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "friend1"
    t.string "friend2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend1", "friend2"], name: "index_friendships_on_friend1_and_friend2", unique: true
    t.index ["friend1"], name: "index_friendships_on_friend1"
    t.index ["friend2"], name: "index_friendships_on_friend2"
  end

end
