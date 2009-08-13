class PageItem < ActiveRecord::Base
  belongs_to :page
  belongs_to :resource, :polymorphic => true
  
  validates_presence_of :page_id, :resource_id, :resource_type
end
