class AddHiddenToStores < ActiveRecord::Migration
  def self.up
    add_column :stores, :hidden, :boolean, :default => false
  end

  def self.down
    remove_column :stores, :hidden
  end
end
