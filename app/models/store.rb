class Store < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :aisles, :order => "position"
end
