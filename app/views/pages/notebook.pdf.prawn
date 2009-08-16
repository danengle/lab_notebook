pdf.footer [0, 0] do
	pdf.stroke_horizontal_rule
end

pdf.text "#{current_user.name.blank? ? current_user.login : current_user.name}'s Lab Notebook", :size => 18, :align => :center

pdf.move_down(20)
@pages.each do |page|
	
	page.page_items.each do |page_item|
		
		case page_item.resource_type
		when "Project", "Experiment"
			pdf.text "#{page_item.created_at.to_s(:long)} - Created #{page_item.resource_type}: #{page_item.resource.title}",
				:size => 12,
				:style => :bold
			pdf.text "#{page_item.resource.description}"
		when "Note"
			pdf.text "#{page_item.created_at.to_s(:long)} - Added note to experiment #{page_item.resource.experiment.title}",
				:size => 12,
				:style => :bold
			pdf.text "#{page_item.resource.body}"
		else
		end
		pdf.move_down(17)
	end
	
end



