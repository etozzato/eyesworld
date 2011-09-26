class User < ActiveRecord::Base
  validates_uniqueness_of   :email, :case_sensitive => false
  validates_format_of       :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "non ha un formato valido"

#  has_many :orders, :dependent => :destroy, :order => 'order_date ASC'
  has_many :orders, :dependent => :destroy, :order => 'id ASC'

  has_many :sales, :dependent => :destroy, :order => 'sale_date ASC'
  has_many :returns, :dependent => :destroy, :order => 'return_date ASC'

  has_many :warehouses

  belongs_to :budget

  def sync_budget

  end

  def verify_budget
    if self.budget.nil? || self.budget.year != Time.now.year
      budget = Budget.create(:user_id => self.id, :year => Time.now.year, :value => 0)
    else
      budget = Budget.find(:first, :conditions => ["user_id = ? AND year = ?", self.id, Time.now.year])
    end
    self.update_attribute(:budget_id, budget.id) if self.budget_id != budget.id
  end

end
