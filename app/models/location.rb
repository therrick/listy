class Location < ActiveRecord::Base
  belongs_to :store
  
  acts_as_list :scope => :store
  
end
