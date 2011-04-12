class Item < ActiveRecord::Base
  belongs_to :location
  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => [:store_id]
  
  def notes_trimmed
    if notes && notes.length > 30
      return notes[0,27] + "..."
    else
      return notes
    end
  end
  
  def self.search(search)
    if search
      where('items.name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
