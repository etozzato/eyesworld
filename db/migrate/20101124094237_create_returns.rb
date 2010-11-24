class CreateReturns < ActiveRecord::Migration
  def self.up
    create_table :returns do |t|
      t.integer     :items_returned
      t.date        :return_date
      t.references  :user
      t.references  :maker
      t.references  :model
      t.timestamps
    end
  end

  def self.down
    drop table :returns
  end
end
