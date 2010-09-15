class Model < ActiveRecord::Base
  belongs_to :maker
  has_many :orders, :dependent => :destroy
  #attr_accessor :parent_discount
end
