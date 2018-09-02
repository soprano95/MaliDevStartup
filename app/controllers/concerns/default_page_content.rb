module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_filter :set_title
	end

	def set_title
  	@page_title = "MaliDevStartup | My Portfolio Website"
  	 @seo_keywords = "Abdallah95 DevStartup"
  end
end
