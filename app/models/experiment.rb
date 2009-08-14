class Experiment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :notes, :dependent => :destroy
  has_one :page_item, :as => :resource
  
  attr_accessor :user
end
