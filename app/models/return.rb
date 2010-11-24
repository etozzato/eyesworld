class Return < ActiveRecord::Base
  belongs_to :user
  named_scope :current, :conditions => ["return_date BETWEEN ? AND ?", "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"]
end