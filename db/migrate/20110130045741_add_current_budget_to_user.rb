class AddCurrentBudgetToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :current_budget, :float
  end

  def self.down
    remove_column :users, :current_budget
  end
end
