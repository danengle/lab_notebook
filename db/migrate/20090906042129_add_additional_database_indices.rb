class AddAdditionalDatabaseIndices < ActiveRecord::Migration
  def self.up
    add_index :attachments, :resource_id
    add_index :attachments, :parent_id
    add_index :experiments, [ :user_id, :project_id ]
    add_index :notes, :experiment_id
    add_index :pages, [:user_id, :page_date], :unique => true
    add_index :page_items, :page_id
    add_index :page_items, :resource_id
    add_index :page_items, [:page_id, :created_at]
    add_index :projects_users, [ :user_id, :project_id ], :unique => true
    add_index :projects, :id
    add_index :users, :id
  end

  def self.down
    remove_index :pages, [:user_id, :page_date]
    remove_index :page_items, :page_id
    remove_index :page_items, :resource_id
    remove_index :page_items, [:page_id, :created_at]
    remove_index :notes, :experiment_id
    remove_index :projects_users, [ :user_id, :project_id ]
    remove_index :projects, :id
    remove_index :attachments, :resource_id
    remove_index :attachments, :parent_id
    remove_index :experiments, [ :user_id, :project_id ]
    remove_index :users, :id
  end
end
