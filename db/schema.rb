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

ActiveRecord::Schema.define(version: 20180721031907) do

  create_table "batting_stats", force: :cascade do |t|
    t.integer "game_id"
    t.integer "team_id"
    t.integer "player_id"
    t.boolean "start", default: true
    t.integer "order"
    t.integer "pos"
    t.integer "ab"
    t.integer "r", default: 0
    t.integer "h", default: 0
    t.integer "rbi", default: 0
    t.integer "so", default: 0
    t.integer "bb", default: 0
    t.integer "hbp", default: 0
    t.integer "sac", default: 0
    t.integer "sb", default: 0
    t.integer "do", default: 0
    t.integer "tr", default: 0
    t.integer "hr", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_batting_stats_on_game_id"
    t.index ["player_id"], name: "index_batting_stats_on_player_id"
    t.index ["team_id"], name: "index_batting_stats_on_team_id"
  end

  create_table "depth_charts", force: :cascade do |t|
    t.integer "team_id"
    t.integer "pos"
    t.integer "first_id"
    t.integer "second_id"
    t.integer "third_id"
    t.integer "fourth_id"
    t.integer "fifth_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fifth_id"], name: "index_depth_charts_on_fifth_id"
    t.index ["first_id"], name: "index_depth_charts_on_first_id"
    t.index ["fourth_id"], name: "index_depth_charts_on_fourth_id"
    t.index ["second_id"], name: "index_depth_charts_on_second_id"
    t.index ["team_id"], name: "index_depth_charts_on_team_id"
    t.index ["third_id"], name: "index_depth_charts_on_third_id"
  end

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.integer "visitor_id"
    t.integer "home_id"
    t.boolean "complete", default: false
    t.integer "vis_runs"
    t.integer "vis_hits"
    t.integer "vis_errors"
    t.integer "home_runs"
    t.integer "home_hits"
    t.integer "home_errors"
    t.integer "winner_id"
    t.integer "loser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_games_on_home_id"
    t.index ["loser_id"], name: "index_games_on_loser_id"
    t.index ["visitor_id"], name: "index_games_on_visitor_id"
    t.index ["winner_id"], name: "index_games_on_winner_id"
  end

  create_table "innings", force: :cascade do |t|
    t.integer "game_id"
    t.integer "inning"
    t.integer "vis_runs", default: 0
    t.integer "home_runs", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_innings_on_game_id"
  end

  create_table "lineups", force: :cascade do |t|
    t.integer "team_id"
    t.integer "one_pos"
    t.integer "one_player_id"
    t.integer "two_pos"
    t.integer "two_player_id"
    t.integer "three_pos"
    t.integer "three_player_id"
    t.integer "four_pos"
    t.integer "four_player_id"
    t.integer "five_pos"
    t.integer "five_player_id"
    t.integer "six_pos"
    t.integer "six_player_id"
    t.integer "seven_pos"
    t.integer "seven_player_id"
    t.integer "eight_pos"
    t.integer "eight_player_id"
    t.integer "nine_pos"
    t.integer "nine_player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eight_player_id"], name: "index_lineups_on_eight_player_id"
    t.index ["five_player_id"], name: "index_lineups_on_five_player_id"
    t.index ["four_player_id"], name: "index_lineups_on_four_player_id"
    t.index ["nine_player_id"], name: "index_lineups_on_nine_player_id"
    t.index ["one_player_id"], name: "index_lineups_on_one_player_id"
    t.index ["seven_player_id"], name: "index_lineups_on_seven_player_id"
    t.index ["six_player_id"], name: "index_lineups_on_six_player_id"
    t.index ["team_id"], name: "index_lineups_on_team_id"
    t.index ["three_player_id"], name: "index_lineups_on_three_player_id"
    t.index ["two_player_id"], name: "index_lineups_on_two_player_id"
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
    t.boolean "start", default: false
    t.integer "outs", null: false
    t.integer "h", default: 0
    t.integer "r", default: 0
    t.integer "er", default: 0
    t.integer "k", default: 0
    t.integer "bb", default: 0
    t.integer "hbp", default: 0
    t.integer "wp", default: 0
    t.integer "do", default: 0
    t.integer "tr", default: 0
    t.integer "hr", default: 0
    t.integer "bf", default: 0
    t.boolean "w", default: false
    t.boolean "l", default: false
    t.boolean "s", default: false
    t.boolean "bs", default: false
    t.boolean "hld", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
