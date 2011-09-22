class Budget < ActiveRecord::Base
  belongs_to :user

  def self.sync(user)
    # calculate sales
    total_orders  = Order.first(:select => 'SUM(total)',
                                :conditions => ["user_id = ? AND order_date >= ?", user.id, "#{Time.now.year}-01-01"])
    # calculate returns
    total_returns = Return.first(:select => 'SUM(total)',
                                 :conditions => ["user_id = ? AND created_at >= ?", user.id, "#{Time.now.year}-01-01"])
    user.update_attribute(:current_budget, -1* total_orders['SUM(total)'].to_f + total_returns['SUM(total)'].to_f)
  end

  def self.rem(user, amount)
    puts "\n\n Rem #{amount} to #{user.email} orig #{user.current_budget} \n\n"
    user.update_attribute(:current_budget, (user.current_budget || 0) - amount)
  end

  def self.add(user, amount)
    puts "\n\n Adding #{amount} to #{user.email} orig #{user.current_budget} \n\n"
    user.update_attribute(:current_budget, (user.current_budget || 0) + amount)
  end

end