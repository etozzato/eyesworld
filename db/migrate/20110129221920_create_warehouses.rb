class CreateWarehouses < ActiveRecord::Migration
  def self.up
    create_table :warehouses do |t|
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
