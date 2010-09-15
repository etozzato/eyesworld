class RefactorSales < ActiveRecord::Migration
  def self.up
    
    drop_table :sales
    
    create_table :sales do |t|
      t.integer :items_sold
      t.date :sale_date
      t.references :user
      t.references :maker
      t.references :model

      t.timestamps
    end
    
  end

  def self.down
    create_table :sales do |t|
      t.float :price
      t.date :sale_date
      t.references :user

      t.timestamps
    end
  end
end
