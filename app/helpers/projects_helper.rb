module ProjectsHelper
	def format_deadline(project)
		if project.pledging_expired?
			content_tag(:strong, 'Campaign has expired!')
		else
			distance_of_time_in_words(Date.today, project.deadline) + " remaining"
		end
	end

	def image_for(project)
		if project.image_file_name.blank?
			image_tag 'DiscountTherapist.jpg', size: '480x320'
		else
			image_tag project.image_file_name, size: '480x320'
		end
	end

	# def featured_campaign(project)
	# 	@project = Project.find_by(name: "Discount Therapist")
	# 	image_tag project.image_file_name, size: '540x360'
	# end

	def youtube_embed(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end
	  
	  %Q{<iframe title="YouTube video player" width="720" height="400" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
	end
end
