module PledgesHelper
	def pledge_link_for(project)
		if project.funded?
			content_tag(:strong, "Funded!")
		else
			hint = content_tag(:span, "Only #{number_to_currency(project.amount_outstanding)} left", class: 'scarcity')
			link_to "Pledge Now! #{hint}".html_safe, new_project_pledge_path(project), class: "btn btn-success"
		end
	end
end
