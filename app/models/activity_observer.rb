class ActivityObserver < ActiveRecord::Observer
  observe :project, :experiment, :note, :attachment
  
  def after_create(record)
    ::ApplicationController::logger.info("#{record.class}: #{record.id}")
    return if record.class.to_s == "Attachment" && !record.thumbnail.blank?
    if true
      page = record.user.pages.find_or_create_by_page_date(record.created_at.to_s(:db))
      page_item = page.page_items.new(:created_at => record.created_at)
    else
      page_item = record.user.todays_page.page_items.new
    end
    page_item.resource = record
    page_item.save
  end
end
