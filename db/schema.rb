# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100924111329) do

  create_table "budgets", :force => true do |t|
    t.integer  "year"
    t.float    "value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "increments", :force => true do |t|
    t.integer  "order_id"
    t.integer  "from"
    t.integer  "to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "received_at"
  end

  create_table "makers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "discount",   :default => 0.0
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.integer  "maker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "discount",   :default => -1.0
  end

  create_table "orders", :force => true do |t|
    t.integer  "items_required"
    t.integer  "items_received"
    t.float    "price"
    t.float    "total"
    t.date     "order_date"
    t.integer  "user_id"
    t.integer  "maker_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "confidential_price", :default => 0.0
    t.float    "discount",           :default => 0.0
  end

  create_table "sales", :force => true do |t|
    t.integer  "items_sold"
    t.date     "sale_date"
    t.integer  "user_id"
    t.integer  "maker_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "stocks", :force => true do |t|
    t.integer  "items"
    t.integer  "user_id"
    t.integer  "maker_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.integer "order_id"
    t.integer "from"
    t.integer "to"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.text     "note"
    t.string   "session_key"
    t.datetime "session_key_expires_on"
    t.string   "password"
    t.integer  "budget_id"
    t.boolean  "active"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
