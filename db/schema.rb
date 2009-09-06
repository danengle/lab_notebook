# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090906042129) do

  create_table "attachments", :force => true do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "filename"
    t.string   "content_type"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "parent_id"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["parent_id"], :name => "index_attachments_on_parent_id"
  add_index "attachments", ["resource_id"], :name => "index_attachments_on_resource_id"

  create_table "experiments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiments", ["user_id", "project_id"], :name => "index_experiments_on_user_id_and_project_id"

  create_table "notes", :force => true do |t|
    t.integer  "experiment_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["experiment_id"], :name => "index_notes_on_experiment_id"

  create_table "page_items", :force => true do |t|
    t.integer  "page_id"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_items", ["page_id", "created_at"], :name => "index_page_items_on_page_id_and_created_at"
  add_index "page_items", ["page_id", "resource_id"], :name => "index_page_items_on_page_id_and_resource_id"
  add_index "page_items", ["page_id"], :name => "index_page_items_on_page_id"
  add_index "page_items", ["resource_id"], :name => "index_page_items_on_resource_id"

  create_table "pages", :force => true do |t|
    t.integer "user_id"
    t.date    "page_date"
  end

  add_index "pages", ["user_id", "page_date"], :name => "index_pages_on_user_id_and_page_date", :unique => true

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "projects", ["id"], :name => "index_projects_on_id"

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], :name => "index_projects_users_on_project_id"
  add_index "projects_users", ["user_id", "project_id"], :name => "index_projects_users_on_user_id_and_project_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                    :default => "passive"
    t.datetime "deleted_at"
  end

  add_index "users", ["id"], :name => "index_users_on_id"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
