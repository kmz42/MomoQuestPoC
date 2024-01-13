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

ActiveRecord::Schema[7.1].define(version: 2024_01_12_120711) do
  create_table "adventure_events", force: :cascade do |t|
    t.integer "adventure_id", null: false
    t.integer "event_id", null: false
    t.boolean "completes_adventure"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adventure_id"], name: "index_adventure_events_on_adventure_id"
    t.index ["event_id"], name: "index_adventure_events_on_event_id"
  end

  create_table "adventures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_infos", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "level"
    t.integer "experience"
    t.integer "hp"
    t.integer "coziness"
    t.integer "fluffiness"
    t.integer "sleepiness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_infos_on_character_id"
  end

  create_table "character_inventories", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_inventories_on_character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "is_alive"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "enemies", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "power"
    t.integer "xp_on_defeat"
    t.integer "gold_on_defeat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "kind"
    t.string "name"
    t.string "description"
    t.integer "enemy_id"
    t.integer "gold_found"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enemy_id"], name: "index_events_on_enemy_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "discord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adventure_events", "adventures"
  add_foreign_key "adventure_events", "events"
  add_foreign_key "character_infos", "characters"
  add_foreign_key "character_inventories", "characters"
  add_foreign_key "characters", "users"
  add_foreign_key "events", "enemies"
end
