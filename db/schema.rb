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

ActiveRecord::Schema[8.0].define(version: 2025_09_11_233610) do
  create_table "accommodations", force: :cascade do |t|
    t.string "name", null: false
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accommodation_type", default: 0, null: false
    t.check_constraint "length(details) >= 20", name: "details_min_length_check"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.text "objectives"
    t.string "category"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progress_entries", force: :cascade do |t|
    t.integer "student_goal_id", null: false
    t.integer "user_id", null: false
    t.date "recorded_on", null: false
    t.text "note"
    t.string "evidence_url"
    t.integer "score_numeric"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_goal_id"], name: "index_progress_entries_on_student_goal_id"
    t.index ["user_id"], name: "index_progress_entries_on_user_id"
  end

  create_table "student_accommodations", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "accommodation_id", null: false
    t.date "start_on"
    t.date "end_on"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_student_accommodations_on_accommodation_id"
    t.index ["student_id"], name: "index_student_accommodations_on_student_id"
  end

  create_table "student_goals", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "goal_id", null: false
    t.date "start_on"
    t.date "target_date"
    t.string "baseline"
    t.string "target_value"
    t.string "status"
    t.integer "mastery_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_student_goals_on_goal_id"
    t.index ["student_id"], name: "index_student_goals_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "dob", null: false
    t.string "diagnosis", null: false
    t.string "grade_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_students_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.check_constraint "role IN ('parent','teacher','admin')", name: "users_role_check"
  end

  add_foreign_key "progress_entries", "student_goals"
  add_foreign_key "progress_entries", "users"
  add_foreign_key "student_accommodations", "accommodations"
  add_foreign_key "student_accommodations", "students"
  add_foreign_key "student_goals", "goals"
  add_foreign_key "student_goals", "students"
  add_foreign_key "students", "users", column: "parent_id"
end
