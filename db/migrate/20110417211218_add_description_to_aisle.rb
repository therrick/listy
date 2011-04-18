class AddDescriptionToAisle < ActiveRecord::Migration
  def self.up
    add_column :aisles, :description, :string
  end

  def self.down
    remove_column :aisles, :description
  end
end
