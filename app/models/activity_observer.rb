class ActivityObserver < ActiveRecord::Observer
  observe :project, :experiment, :note
  
  def after_create(record)
    page_item = record.user.todays_page.page_items.new
    page_item.resource = record
    page_item.save
  end
end
