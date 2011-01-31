class CreateArchives < ActiveRecord::Migration
  def self.up

    create_table :order_archives do |t|
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

    create_table :sale_archives do |t|
      t.integer  "items_sold"
      t.date     "sale_date"
      t.integer  "user_id"
      t.integer  "maker_id"
      t.integer  "model_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :return_archives do |t|
      t.integer  "items_returned"
      t.date     "return_date"
      t.integer  "user_id"
      t.integer  "maker_id"
      t.integer  "model_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.float    "total"
    end

  end

  def self.down
  end
end
