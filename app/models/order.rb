class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :maker
  belongs_to :model
  
  has_many :increments, :order => "received_at ASC"

  named_scope :current, :conditions => ["order_date BETWEEN ? AND ?", "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"]
  
end
