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

ActiveRecord::Schema[7.0].define(version: 2024_03_20_202947) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labours", force: :cascade do |t|
    t.integer "category_id", null: false
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_labours_on_category_id"
  end

  create_table "service_labours", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "labour_id", null: false
    t.integer "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["labour_id"], name: "index_service_labours_on_labour_id"
    t.index ["service_id"], name: "index_service_labours_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "technician_id", null: false
    t.string "description"
    t.date "initial_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_services_on_client_id"
    t.index ["technician_id"], name: "index_services_on_technician_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technician_skills", force: :cascade do |t|
    t.integer "technician_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
    t.index ["skill_id"], name: "index_technician_skills_on_skill_id"
    t.index ["technician_id"], name: "index_technician_skills_on_technician_id"
  end

  create_table "technicians", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "labours", "categories"
  add_foreign_key "service_labours", "labours"
  add_foreign_key "service_labours", "services"
  add_foreign_key "services", "clients"
  add_foreign_key "services", "technicians"
  add_foreign_key "technician_skills", "skills"
  add_foreign_key "technician_skills", "technicians"
end
