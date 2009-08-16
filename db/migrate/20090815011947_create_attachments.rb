class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :filename, :content_type, :thumbnail
      t.integer :size, :parent_id, :height, :width
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
