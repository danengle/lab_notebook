class Note < ActiveRecord::Base
  define_index do
    indexes title
    indexes body
  end
  
  belongs_to :experiment
  has_one :page_item, :as => :resource
  has_many :attachments, :as => :resource
  
  validates_presence_of :body
  
  attr_accessor :user
  
end
