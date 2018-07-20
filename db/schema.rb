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

ActiveRecord::Schema.define(version: 20180720181918) do

  create_table "batting_stats", force: :cascade do |t|
    t.integer "game_id"
    t.integer "team_id"
    t.integer "player_id"
    t.boolean "start"
    t.integer "order"
    t.integer "pos"
    t.integer "ab"
    t.integer "r"
    t.integer "h"
    t.integer "rbi"
    t.integer "so"
    t.integer "bb"
    t.integer "hbp"
    t.integer "sac"
    t.integer "sb"
    t.integer "do"
    t.integer "tr"
    t.integer "hr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_batting_stats_on_game_id"
    t.index ["player_id"], name: "index_batting_stats_on_player_id"
    t.index ["team_id"], name: "index_batting_stats_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.integer "visitor_id"
    t.integer "home_id"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vis_runs"
    t.integer "vis_hits"
    t.integer "vis_errors"
    t.integer "home_runs"
    t.integer "home_hits"
    t.integer "home_errors"
    t.integer "winner_id"
    t.integer "loser_id"
    t.index ["home_id"], name: "index_games_on_home_id"
    t.index ["loser_id"], name: "index_games_on_loser_id"
    t.index ["visitor_id"], name: "index_games_on_visitor_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "innings", force: :cascade do |t|
    t.integer "game_id"
    t.integer "vis_runs"
    t.integer "home_runs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inning"
    t.index ["game_id"], name: "index_innings_on_game_id"
  end

  create_table "news_stories", force: :cascade do |t|
    t.integer "game_id"
    t.text "story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_news_stories_on_game_id"
  end

  create_table "pitching_stats", force: :cascade do |t|
    t.integer "game_id"
    t.integer "team_id"
    t.integer "player_id"
    t.integer "outs"
    t.integer "h"
    t.integer "r"
    t.integer "er"
    t.integer "k"
    t.integer "bb"
    t.integer "hbp"
    t.integer "wp"
    t.integer "do"
    t.integer "tr"
    t.integer "hr"
    t.integer "bf"
    t.boolean "w"
    t.boolean "l"
    t.boolean "s"
    t.boolean "bs"
    t.boolean "hld"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "start"
    t.index ["game_id"], name: "index_pitching_stats_on_game_id"
    t.index ["player_id"], name: "index_pitching_stats_on_player_id"
    t.index ["team_id"], name: "index_pitching_stats_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "division"
    t.string "conference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
