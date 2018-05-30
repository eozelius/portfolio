class WaypointImagesController < ApplicationController
	def new
		@waypoint_image = WaypointImage.new
	end

	def create
		@waypoint = Waypoint.find(params[:waypoint_id])
		params[:photo].each do |image|
			@waypoint.waypoint_images.build(image: image[1])
		end

		if @waypoint.save
			flash[:success] = "Gallery Created successfully."
			redirect_to current_user
		else
			render 'new'
		end
	end

	def update
		@blip = Blip.find(params[:id])

		params[:blip_image].each do |image|
			@blip_image = @blip.blip_images.build( image: image[1]["image"] )
		end

		if @blip.save
			status = 200
			message = 'success'
		else
			status = 500
			message = 'failure'
		end

		render json: { 
			status:  status,
			message: message,
		}
	end

	def destroy

	end

	private
		def waypoint_image_params
			params.require(:waypoint_image).permit(:image, :description)
		end
end