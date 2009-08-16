class Project < ActiveRecord::Base
  define_index do
    indexes title
    indexes description
  end
  
  has_and_belongs_to_many :users
  has_many :experiments, :dependent => :destroy
  belongs_to :owner, :class_name => 'User'

  validates_presence_of :title, :description
  
  attr_accessor :user
end
