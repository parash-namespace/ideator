class StaticController < ApplicationController

	def about
	end

	def random
		@idea = Idea.order("RANDOM()").first
	end

end