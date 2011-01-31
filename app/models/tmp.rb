class Tmp < ActiveRecord::Base
 set_table_name 'orders'
 belongs_to :user
 belongs_to :maker
 belongs_to :model
 
end