module ApplicationHelper
	def login_helper style = ''
	   if current_user.is_a?(GuestUser)
      (link_to "S'inscrirer", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Connectez", new_user_session_path, class: style)
    else
      link_to "Deconnetez", destroy_user_session_path, method: :delete, class: style 
    end
  end
    
    def source_helper(layout_name)
    	if session[:source]
    		greeting = "Thanks for visiting me me from #{session[:source]} and you are on the #{layout_name} layout"
    		content_tag(:p, greeting, class: "source_greeting")
    	end
    end
    def copyright_generator
    	MaliDevStartupViewTool::Renderer.copyright 'Abdoul Aziz Sacko', 'Tous les droits sont réservés'
    end
end
