class Page < ActiveRecord::Base
  belongs_to :user
  has_many :page_items, :order => "created_at ASC", :dependent => :destroy
  
  validates_presence_of :user_id, :page_date
  
  validates_uniqueness_of :page_date, :scope => :user_id
end
