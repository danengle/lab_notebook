class CreatePageItems < ActiveRecord::Migration
  def self.up
    create_table :page_items do |t|
      t.integer :page_id
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
  end

  def self.down
    drop_table :page_items
  end
end
