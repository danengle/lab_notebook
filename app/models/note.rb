class Note < ActiveRecord::Base
  belongs_to :experiment
  has_one :page_item, :as => :resource
end
