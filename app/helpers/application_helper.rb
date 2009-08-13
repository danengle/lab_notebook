# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def item_text(item)
    case item.class.to_s
    when "Note"
      item.body
    else
      item.description
    end 
  end
end
