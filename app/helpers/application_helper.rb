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
  
  def item_link(item)
    case item.class.to_s
    when "Project"
      link_to "View Project: #{item.title}", item, :class => 'more'
    when "Experiment"
      link_to "View Experiment: #{item.title}", [item.project, item], :class => 'comments'
    else
      link_to "View Experiment: #{item.experiment.title}", [item.experiment.project, item.experiment], :class => 'comments'
    end
    
  end
end
