class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
    
    create_table :projects_users, :id => false do |t|
      t.integer :project_id, :user_id
    end
  end

  def self.down
    drop_table :projects
    drop_table :projects_users
  end
end
