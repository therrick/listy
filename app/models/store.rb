class Store < ActiveRecord::Base
  has_many :items
  has_many :locations, :order => "position"
end
