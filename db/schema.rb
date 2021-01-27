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

ActiveRecord::Schema.define(version: 2021_01_07_114014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "incharges", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.boolean "user", default: true
    t.index ["email"], name: "index_incharges_on_email", unique: true
    t.index ["reset_password_token"], name: "index_incharges_on_reset_password_token", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "model_number"
    t.string "make"
    t.date "installation_date"
    t.date "warranty"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "incharge_id"
    t.boolean "approved", default: false
    t.boolean "complaint", default: false
    t.text "description", default: "NA"
    t.string "lab_name"
    t.string "typeofpurchase"
    t.index ["incharge_id"], name: "index_items_on_incharge_id"
  end

end
