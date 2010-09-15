class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :items_required
      t.integer :items_received
      t.float :price
      t.float :total
      t.date :order_date
      t.references :user
      t.references :maker
      t.references :model

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end