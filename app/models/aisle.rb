class Aisle < ActiveRecord::Base
  belongs_to :store
  has_many :items, :dependent => :nullify
  
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
    if (description.length > 25)
      description[0..22] + "..."
    else
      description
    end
  end
end
