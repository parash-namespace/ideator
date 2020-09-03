class IdeasController < ApplicationController

	before_action :assign_idea, only: [:edit, :update, :destroy]


	def index
		@ideas = Idea.paginate(page: params[:page], per_page: 2)
	end

	def create
		@idea = Idea.create(idea_params)
		
		if @idea.valid?
			flash[:success] = 'Idea created.'
		else
			flash[:failure] = 'Failed to create Idea.'
			# implement later
		end
		
		redirect_to root_path
	end

	def edit
	end

	def update
		if @idea.update(idea_params)
			flash[:success] = "The idea has been updated!"
			redirect_to root_path
		else
			flash[:failure] = "Woops! Looks like there has been an error!"
			redirect_to edit_idea_path(params[:id])
		end
	end


	def destroy
		@idea.destroy
		flash[:success] = "The idea was successfully deleted!"
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
