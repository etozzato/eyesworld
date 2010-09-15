class UpdateMakers < ActiveRecord::Migration
  def self.up
    add_column :makers, :discount, :float, :default => 0
    add_column :models, :discount, :float, :default => -1
  end

  def self.down
  end
end
