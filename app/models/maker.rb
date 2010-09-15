class Maker < ActiveRecord::Base
  has_many :models, :dependent => :destroy, :order => "name ASC"
  has_many :orders, :dependent => :destroy
end
