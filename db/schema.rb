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

ActiveRecord::Schema.define(version: 20160615094109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_players", force: :cascade do |t|
    t.integer  "match_team_id"
    t.integer  "team_player_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "queen_pocket",   default: false
    t.integer  "coin_count",     default: 0
    t.integer  "opp_coin_count", default: 0
    t.integer  "due_count",      default: 0
  end

  create_table "match_teams", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "tournament_team_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "match_no"
    t.string   "match_date"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "winning_team_id"
    t.integer  "queen_player_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "board_points"
    t.string   "comments"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.integer  "team_id"
    t.string   "image"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
  end

  create_table "team_players", force: :cascade do |t|
    t.integer  "tournament_team_id"
    t.integer  "player_id"
    t.integer  "buy_price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "score",      default: 1500
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tournament_teams", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "team_id"
    t.integer  "total_budget"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
