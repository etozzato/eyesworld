class Warehouse < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :maker
  belongs_to :model

  def self.add(user_id, maker_id, model_id, quantity)
    if entry = find_by_user_id_and_maker_id_and_model_id(user_id, maker_id, model_id)
      entry.items = entry.items + quantity
      entry.save
    else
      create(:user_id => user_id, :maker_id => maker_id, :model_id => model_id, :items => quantity)
    end
  end

  def self.rem(user_id, maker_id, model_id, quantity)
    if entry = find_by_user_id_and_maker_id_and_model_id(user_id, maker_id, model_id)
      entry.items = entry.items - quantity
      if entry.items > 0
        entry.save
      else
        entry.destroy
      end
    end
  end
  
  def self.available?(user_id, maker_id, model_id, quantity)
    entry = find_by_user_id_and_maker_id_and_model_id(user_id, maker_id, model_id)
    !entry.nil? && entry.items >= quantity
  end

  def items_available
    self.quantity
  end


end