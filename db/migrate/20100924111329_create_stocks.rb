class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.integer :items
      t.references :user
      t.references :maker
      t.references :model
      t.timestamps
    end
  end

  def self.down
  end
end
