class RenameLocationToAisle < ActiveRecord::Migration
  def self.up
    rename_table :locations, :aisles
    rename_column :items, :location_id, :aisle_id
  end

  def self.down
    rename_table :aisles, :locations
    rename_column :items, :aisle_id, :location_id
  end
end
