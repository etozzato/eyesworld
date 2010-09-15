class UpdateIncrementTable < ActiveRecord::Migration
  def self.up
    add_column :increments, :received_at, :datetime
  end

  def self.down
    remove_column  :increments, :received_at
  end
end
