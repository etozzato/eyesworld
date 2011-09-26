class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :maker
  belongs_to :model
  
  has_many :increments, :order => "received_at ASC", :dependent => :destroy

  def self.for_user(user_id)
    all(:conditions => ["user_id = ? AND (order_date BETWEEN ? AND ? AND items_required > items_received OR order_date BETWEEN ? AND ?)", user_id, "#{(Time.now.year)-1}-01-01", "#{(Time.now.year)-1}-12-31", "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"],
        :order => "id DESC")
  end
  
end
