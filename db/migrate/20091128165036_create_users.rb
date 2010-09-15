class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :username
      t.text :note
      t.string :session_key
      t.datetime :session_key_expires_on
      t.string :password
      t.integer :budget_id
      t.boolean :active
      t.boolean :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end