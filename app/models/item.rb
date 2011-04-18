class Item < ActiveRecord::Base
  belongs_to :aisle
  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => [:store_id]
  
  def notes_trimmed
    if notes && notes.length > 30
      return notes[0,27] + "..."
    else
      return notes
    end
  end
  
  def mark_purchased
    new_pop = popularity + number_needed # for some unfathomable reason, popularity += number_needed blows up here
    popularity = new_pop
    number_needed = 0
  end
  
  def self.search(search)
    if search
      where('items.name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
