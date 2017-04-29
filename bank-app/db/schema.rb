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

ActiveRecord::Schema.define(version: 20170429054005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal  "balance"
    t.integer  "account_number"
    t.text     "description"
    t.boolean  "is_open"
    t.integer  "customer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "banks", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.text     "abn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "customer_number"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "contact_number"
    t.integer  "tfn"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "bank_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.text     "transaction_type"
    t.integer  "account_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
