class Model < ActiveRecord::Base
  belongs_to :maker
  has_many :orders, :dependent => :destroy
end
