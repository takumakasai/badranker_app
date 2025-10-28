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

ActiveRecord::Schema[7.0].define(version: 2025_07_27_050111) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.bigint "challenger_id"
    t.bigint "defender_id"
    t.integer "challenger_result_status", null: false
    t.integer "defender_approval_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenger_id"], name: "index_battles_on_challenger_id"
    t.index ["defender_id"], name: "index_battles_on_defender_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "badge_icon_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_quests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quest_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_user_quests_on_quest_id"
    t.index ["user_id"], name: "index_user_quests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "rank"
    t.string "status"
    t.string "display_id"
    t.string "password"
    t.string "play_style"
    t.integer "offense"
    t.integer "defense"
    t.integer "speed"
    t.integer "stability"
    t.string "special_skill"
    t.text "description"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "battles", "users", column: "challenger_id"
  add_foreign_key "battles", "users", column: "defender_id"
  add_foreign_key "user_quests", "quests"
  add_foreign_key "user_quests", "users"
end
