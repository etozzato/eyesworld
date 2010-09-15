class UpdateDiscounts < ActiveRecord::Migration
  def self.up
    
    makers = [[15, 1], [10, 46], [15, 14], [8, 67], [12, 28], [3, 32], [15, 8], [10, 13], [7, 4], [22.5, 2], [15, 6], [15, 3], [25, 15], [5, 12]]

    makers.each do |el|
     Maker.update(el.at(1), :discount => el.at(0))
    end
    
    
    
  end

  def self.down
  end
end
