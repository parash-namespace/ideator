module Api
	module Current

		class IdeasController < ApplicationController

			before_action :assign_idea, only: [:edit, :update, :destroy, :show]
			skip_before_action :verify_authenticity_token
			# http_basic_authenticate_with name: "dhh", password: "secret", only: :index

			def index
				ideas = Idea.all

				if ideas.any?
					render json: {status: 'SUCCESS', message: 'Ideas returned', data: ideas}, status: :ok
				else
					render json: {status: 'SUCCESS', message: 'No ideas to show'}, status: :ok
				end
			end

			def create
				@idea = Idea.create(idea_params)
				
				if @idea.valid?
					render json: {status: 'SUCCESS', message: 'Idea created.'}, status: :ok
				else
					render json: {status: 'FAILED', message: 'Failed to create idea.'}, status: :bad_request
				end
			end

			def update
				if @idea.update(idea_params)
					render json: {status: 'SUCCESS', message: 'Updated idea'}, status: :ok
				else
					render json: {status: 'FAILED', message: 'Failed to update idea'}, status: :bad_request
				end
			end

			def show
				if(@idea)
					render json: {status: 'SUCCESS', message: 'Found idea', data: @idea}, status: :ok
				else
					render json: {status: 'FAILED', message: 'Idea not found'}, status: :not_found
				end
			end


			def destroy
				if(@idea)
					@idea.destroy
					render json: {status: 'SUCCESS', message: 'Deleted idea'}, status: :ok
				else
					render json: {status: 'FAILED', message: 'Idea not found'}, status: :not_found
				end
			end



			private

			def idea_params
				{:description => params[:description], :author => params[:author] }
			end

			def assign_idea
				@idea = Idea.find_by('id': params[:id])
			end

		end
	end
end
