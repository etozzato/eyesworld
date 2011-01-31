class AddTotalToReturn < ActiveRecord::Migration
  def self.up
    add_column :returns, :total, :float
  end

  def self.down
    remove_column :returns, :total
  end
end
