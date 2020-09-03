class IdeasController < ApplicationController

	before_action :assign_idea, only: [:edit, :update, :destroy]


	def index
		@ideas = Idea.all
	end

	def create
		@idea = Idea.create(idea_params)
		
		# if @idea.valid?
			# implement later
		# else
			# implement later
		# end
		
		redirect_to root_path
	end

	def edit
	end

	def update
		if @idea.update(idea_params)
			redirect_to root_path
		else
			redirect_to edit_idea_path(params[:id])
		end
	end


	def destroy
		@idea.destroy
		redirect_to root_path
	end



	private

	def idea_params
		params.require(:idea).permit(:description, :author)
	end

	def assign_idea
		@idea = Idea.find(params[:id])
	end


end
