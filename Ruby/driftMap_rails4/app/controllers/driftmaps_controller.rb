class DriftmapsController < ApplicationController
	before_action :logged_in_user,	only: [:create,  :update, :destroy]
	before_action :correct_user,	  only: [:destroy, :update]

	def create
		@user = current_user
		@driftmap = Driftmap.create(driftmap_params)
		@driftmap.user_id = @user.id

		if @user.valid? && @driftmap.valid?
			@user.driftmap = @driftmap
			@user.save
			flash[:success] = "driftmap created successfully"
			redirect_to @user
		else
			flash[:danger] = "Whoops something went wrong, please try again"
			render 'new'
		end
	end

	def edit
		@driftmap = Driftmap.find(params[:id])
	end

	def update
		@driftmap = Driftmap.find(params[:id])
		@user = User.find(@driftmap.user_id)

		if @driftmap.update_attributes(driftmap_params)
			flash[:success] = "driftmap successfully updated"
			redirect_to @user
		else
			flash[:danger] = "whoops! Something went wrong, please try again"
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		flash[:info] = "Post deleted"
		redirect_to current_user
	end

	private

		def create_blip_images
			params[:blip]["0"]["photos"].each do |photo|
				@blip_img = @blip.blip_images.build( image: photo[1] )
			end
		end

		def driftmap_params
			params.require(:driftmap).permit(:title, :body, :init_x, :init_y, :init_zoom, :color_scheme)
		end

		def correct_user
			return true if current_user.admin?

			post = Post.find(params[:id])

			if post.nil? || post.user_id != current_user.id
				flash.now[:danger] = "you do not have permission do that"
				redirect_to root_url				
			end
		end
end
