class CreateOrderUpdates < ActiveRecord::Migration
  def self.up
    
    create_table :increments do |t|
      t.integer :order_id
      t.integer :from, :to
      
      t.timestamps
    end
    
  end

  def self.down
  end
end
