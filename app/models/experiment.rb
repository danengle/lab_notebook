class Experiment < ActiveRecord::Base
  define_index do
    indexes title
    indexes description
  end 
  
  belongs_to :project
  belongs_to :user
  has_many :notes, :dependent => :destroy
  has_one :page_item, :as => :resource
  has_many :attachments, :as => :resource, :dependent => :destroy
  
  attr_accessor :user
  
  validates_presence_of :project_id, :user_id, :title, :description
end
