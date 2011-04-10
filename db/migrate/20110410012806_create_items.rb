class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.integer :store_id
      t.integer :number_needed
      t.integer :location_id
      t.string :notes
      t.integer :popularity

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
