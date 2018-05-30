class EssaysController < ApplicationController
  def new
    @essay = Essay.new
  end

  def create
    @waypoint = Waypoint.find(params[:waypoint_id])
    if @waypoint.present?
      @essay = @waypoint.essays.create(essay_params)

      if @essay.valid?
        flash[:success] = "essay successfully created"
        redirect_to current_user
      else
        flash[:danger] = "whoops, something went wrong" 
        render 'new'
      end
    end
  end

  def edit
    @essay = Essay.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def essay_params
      params.require(:essay).permit(:title, :body, :coverphoto, :x, :y)
    end
end
