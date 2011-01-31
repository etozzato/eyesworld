class Return < ActiveRecord::Base
  belongs_to :user

  def self.for_user(user_id)
    all(:conditions => ["user_id = ? AND return_date BETWEEN ? AND ?", user_id, "#{Time.now.year}-01-01", "#{Time.now.year}-12-31"],
        :order => "return_date DESC")
  end

end