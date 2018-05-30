class GalleriesController < ApplicationController
  def new
    @gallery = Gallery.new
  end

  def create
    @waypoint = Waypoint.find(params[:waypoint_id])
    if @waypoint.present?
      @gallery = @waypoint.galleries.create(gallery_params)

      if @gallery.valid?
        new_photos @gallery if params[:photo].present?
        
        flash[:success] = "gallery successfully created"
        redirect_to current_user
      else
        flash[:danger] = "whoops, something went wrong" 
        render 'new'
      end
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @waypoint = Waypoint.find(@gallery.waypoint_id)
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update_attributes(gallery_params)
      @gallery.save
      new_photos @gallery if params[:photo].present?

      flash[:success] = "#{@gallery.title.html_safe} successfully updated"
      redirect_to current_user
    else
      flash[:danger] = 'whoops, something went wrong'
      render 'edit'
    end
  end

  def destroy

  end

  private
    def gallery_params
      params.require(:gallery).permit(:title, :description, :x, :y, :coverphoto)
    end

    def new_photos gallery
      params[:photo].each do |image|
        gallery.waypoint_images.build(image: image[1])
      end
      gallery.save
    end
end