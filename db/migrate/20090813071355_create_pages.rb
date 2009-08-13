class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :user_id
      t.date :page_date
    end
  end

  def self.down
    drop_table :pages
  end
end
