class LocationsRenameSortToPosition < ActiveRecord::Migration
  def self.up
    rename_column :locations, :sort, :position
  end

  def self.down
    rename_column :locations, :position, :sort
  end
end
