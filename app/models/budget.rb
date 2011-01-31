class Budget < ActiveRecord::Base
  belongs_to :user
  
  def self.rem(user, amount)
    puts "\n\n Rem #{amount} to #{user.email} orig #{user.current_budget} \n\n"
    user.update_attribute(:current_budget, (user.current_budget || 0) - amount)
  end

  def self.add(user, amount)
    puts "\n\n Adding #{amount} to #{user.email} orig #{user.current_budget} \n\n"
    user.update_attribute(:current_budget, (user.current_budget || 0) + amount)
  end

end