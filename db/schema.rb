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

ActiveRecord::Schema.define(version: 2019_04_26_102722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_addresses_on_company_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.decimal "settlement_account", precision: 20
    t.integer "bank_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_bank_accounts_on_bank_id"
    t.index ["company_id"], name: "index_bank_accounts_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.string "type", default: "Trader", null: false
    t.bigint "inn", null: false
    t.bigint "kpp", null: false
    t.bigint "ogrn", null: false
    t.decimal "correspondent_account", precision: 20
    t.string "bik"
    t.bigint "legal_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bik"], name: "index_companies_on_bik"
    t.index ["inn"], name: "index_companies_on_inn", unique: true
    t.index ["legal_form_id"], name: "index_companies_on_legal_form_id"
    t.index ["ogrn"], name: "index_companies_on_ogrn", unique: true
  end

  create_table "employers", force: :cascade do |t|
    t.integer "post", null: false
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employers_on_company_id"
    t.index ["user_id"], name: "index_employers_on_user_id"
  end

  create_table "legal_forms", force: :cascade do |t|
    t.string "less_title", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "middle_name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "companies"
  add_foreign_key "companies", "legal_forms"
  add_foreign_key "employers", "companies"
  add_foreign_key "employers", "users"
end
