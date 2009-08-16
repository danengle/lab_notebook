class ActivityObserver < ActiveRecord::Observer
  observe :project, :experiment, :note, :attachment
  
  def after_create(record)
    return if record.class.to_s == "Attachment" && !record.thumbnail.blank?
    page_item = record.user.todays_page.page_items.new
    page_item.resource = record
    page_item.save
  end
end
