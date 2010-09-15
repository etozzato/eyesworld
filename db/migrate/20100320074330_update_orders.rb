class UpdateOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :confidential_price, :float, :default => 0
    add_column :orders, :discount, :float, :default => 0
  end

  def self.down
  end
end
