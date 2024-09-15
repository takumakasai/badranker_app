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

ActiveRecord::Schema[7.0].define(version: 2024_06_29_072140) do
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

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "rank"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "battles", "users", column: "challenger_id"
  add_foreign_key "battles", "users", column: "defender_id"
end
