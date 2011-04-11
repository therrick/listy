class Store < ActiveRecord::Base
  has_many :items
  has_many :locations
end
