class Attachment < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  has_one :page_item, :as => :resource
  
  has_attachment :max_size => 6.megabytes,
                 :thumbnails => { :thumbnail => '100x100' },
                 :storage => :file_system
  
  attr_accessor :user
  
  validates_as_attachment
    
  after_attachment_saved do |record|
    logger.info { "\n\nrecord = #{record.inspect}\n\n" }
  end
  
  # before_thumbnail_saved do |thumbnail|
    # record = thumbnail.parent
    
  # end
end
