class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :experiments, :dependent => :destroy

  validates_presence_of :title, :description
end
