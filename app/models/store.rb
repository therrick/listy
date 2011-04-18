class Store < ActiveRecord::Base
  has_many :items
  has_many :aisles, :order => "position"
end
