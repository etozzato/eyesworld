class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.float :price
      t.date :sale_date
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end