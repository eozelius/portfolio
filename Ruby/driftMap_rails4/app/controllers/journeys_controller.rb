class JourneysController < ApplicationController
	before_action :logged_in_user

	def new
		@user = current_user
		@journey = @user.driftmap.journeys.new
	end

	def create
		@user = current_user
		@driftmap = @user.driftmap
		@journey = Journey.new(journey_params)
		@journey.driftmap_id = @driftmap.id

		if @journey.save
			flash[:success] = 'journey created successfully, now create the first waypoint'
			redirect_to controller: 'waypoints', action: 'new', journey_id: @journey.id, first_wp: true
		else
			flash[:danger] = 'whoops, something went wrong, please try again'
			render 'new'
		end
	end

	def edit
		@user = current_user
		@driftmap = current_user.driftmap
		@journey = Journey.find(params[:id])
		@waypoints = @journey.waypoints
	end

	def update
		@journey = Journey.find(params[:id])

		if @journey.update_attributes(journey_params)
			flash[:success] = 'Journey updated successfully'
			redirect_to current_user
		else
			render 'edit'
		end
	end

	def show
		@user  = current_user
		@post  = @user.post
		@route = Route.find(params[:id])
		@blips = @route.blips.order(:date)
	end

	def destroy
		j = Journey.find(params[:id])
		j.destroy

		redirect_to current_user
	end

	private
		def journey_params
			params.require(:journey).permit(:title, :description, :coverphoto)
		end
end