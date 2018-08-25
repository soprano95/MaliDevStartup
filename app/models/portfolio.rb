class Portfolio < ApplicationRecord
	def index
		@portfolio_items = Portfolio.all
	end 
end
