# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_24_040433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_types", force: :cascade do |t|
    t.string "game_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "gameable_id"
    t.string "gameable_type"
    t.string "name"
    t.string "game_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "participant_teams_ids", default: [], array: true
    t.integer "no_of_winners"
    t.integer "winners_ids", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "group_id"
    t.integer "tournament_id"
    t.integer "high_scorer_team", default: [], array: true
    t.string "match_type", default: ""
    t.datetime "match_date"
    t.jsonb "scoreboard", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_matches_on_group_id"
  end

  create_table "participant_teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.bigint "team_id", null: false
    t.string "team_name"
    t.boolean "is_grouped", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_participant_teams_on_team_id"
    t.index ["tournament_id"], name: "index_participant_teams_on_tournament_id"
    t.index ["user_id"], name: "index_participant_teams_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "super_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_super_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_super_admins_on_reset_password_token", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "team_name"
    t.integer "captain_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "teams_palyers", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_teams_palyers_on_player_id"
    t.index ["team_id"], name: "index_teams_palyers_on_team_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.bigint "tournamentable_id"
    t.string "tournamentable_type"
    t.bigint "game_id"
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal "entry_fee", default: "0.0"
    t.decimal "winner_1_prize", default: "0.0"
    t.decimal "winner_2_prize", default: "0.0"
    t.decimal "winner_3_prize", default: "0.0"
    t.integer "no_of_winners", default: 0
    t.integer "max_team", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: ""
    t.index ["game_id"], name: "index_tournaments_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "is_verified", default: false
    t.string "role"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "teams_palyers", "players"
  add_foreign_key "teams_palyers", "teams"
end
