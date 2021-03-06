# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_22_115024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string "name"
    t.decimal "money"
    t.bigint "garin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kind", default: 0
    t.decimal "current_money"
    t.integer "is_totaled"
    t.bigint "time_period_id", null: false
    t.index ["garin_id"], name: "index_budgets_on_garin_id"
    t.index ["time_period_id"], name: "index_budgets_on_time_period_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "garins", force: :cascade do |t|
    t.string "name"
    t.decimal "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "new_budgets"
    t.integer "start_money"
    t.integer "start_day"
  end

  create_table "time_periods", force: :cascade do |t|
    t.date "date"
    t.integer "length"
    t.bigint "garin_id", null: false
    t.decimal "current_money"
    t.decimal "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garin_id"], name: "index_time_periods_on_garin_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "money"
    t.bigint "budget_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.bigint "garin_id"
    t.date "date"
    t.bigint "user_id"
    t.index ["budget_id"], name: "index_transactions_on_budget_id"
    t.index ["garin_id"], name: "index_transactions_on_garin_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "garin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["garin_id"], name: "index_users_on_garin_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budgets", "garins"
  add_foreign_key "budgets", "time_periods"
  add_foreign_key "time_periods", "garins"
  add_foreign_key "transactions", "budgets"
  add_foreign_key "transactions", "users"
end
