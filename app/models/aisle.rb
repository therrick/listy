class Aisle < ActiveRecord::Base
  belongs_to :store
  
  validates_length_of :name, :maximum=>8
  validates_length_of :description, :maximum=>50
  
  
  acts_as_list :scope => :store
  
  def to_label
    if description
      "#{name} - #{truncated_description}"
    else
      name
    end
  end
  
  def truncated_description
    return nil if !description
    if (description.length > 20)
      description[0..17] + "..."
    else
      description
    end
  end
end
