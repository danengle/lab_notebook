class CreateExperiments < ActiveRecord::Migration
  def self.up
    create_table :experiments do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :experiments
  end
end
