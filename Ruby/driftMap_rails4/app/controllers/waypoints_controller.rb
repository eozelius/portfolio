class WaypointsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy ]

	def new
		@waypoint = Waypoint.new
	end

	def create
		@waypoint = Waypoint.new(waypoint_params)
		@driftmap = current_user.driftmap
		@waypoint.journey_id = params[:journey_id]

		date = Date.new(params[:waypoint][:date].slice(0, 4).to_i,
										params[:waypoint][:date].slice(4, 2).to_i,
										params[:waypoint][:date].slice(6, 2).to_i);

		@waypoint.date = date

		if @waypoint.save
			flash.now[:success] = "waypoint created successfully, now add some photos, friends, or writing"
			redirect_to controller: 'waypoints', action: 'content_creation', waypoint_id: @waypoint.id, journey_id: params[:journey_id]
		else
			flash[:danger] = 'whoops, something went wrong'
			render 'new'
		end
	end

	def edit
		@user = current_user
		@waypoint = Waypoint.find(params[:id])
	end

	def update
		@waypoint = Waypoint.find(params[:id])

		if @waypoint.update_attributes(waypoint_params)
			# update date
			date = Date.new(params[:waypoint][:date].slice(0, 4).to_i,
											params[:waypoint][:date].slice(4, 2).to_i,
											params[:waypoint][:date].slice(6, 2).to_i);

			@waypoint.date = date
			@waypoint.save

			if params[:photo].present?
				params[:photo].each do |image|
					@waypoint.waypoint_images.build(image: image[1])
				end
				@waypoint.save
			end
			flash[:success] = "#{@waypoint.title.html_safe} successfully updated"
			redirect_to current_user
		else
			flash[:danger] = 'whoops, something went wrong'
			render 'edit'
		end
	end

	def show
		@blip = Blip.find(params[:id])
		@user = User.find(Post.find(@blip.post_id).user_id);
	end


	def destroy
		blip = Blip.find(params[:id])
		user = User.find(Post.find(blip.post_id).user_id) # wowzers

		blip.destroy
		user.reload
		flash[:success] = "Blip deleted"
		redirect_to user
	end

	def content_creation
		@journey  = Journey.find(params[:journey_id])
		@waypoint = Waypoint.find(params[:waypoint_id])

		@galleries = @waypoint.galleries
		@friends   = @waypoint.friends
		@essays    = @waypoint.essays
		@treks     = @waypoint.treks
		
		render 'waypoints/content_creation'
	end

	private
		# todo, implement strong params
		def waypoint_params
			params.require(:waypoint).permit(:title, :body, :x, :y, :date, :coverphoto)
		end
end


=begin

# user choose to create a new blip
if params[:new_blip].present?
	date = Date.new(params[:blip_date].slice(0, 4).to_i, 
									params[:blip_date].slice(4, 2).to_i, 
									params[:blip_date].slice(6, 2).to_i);

	@blip = Blip.new(
		title: params[:waypoint_title],
		body:  params[:blip_description],
		x: 		 params[:blip_x],
		y:  	 params[:blip_y],
		date:  date
	)
	@blip.post_id = @post.id
	@blip.route_id = @route.id

	# Any Photos to new blip?
	if params[:photo].present?
		params[:photo].each do |image|
			@blip.blip_images.build(image: image[1])
		end
	end
	@blip.save
end

=end