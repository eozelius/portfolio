class TreksController < ApplicationController
  def new
    @trek = Trek.new
  end

  def create
    @waypoint = Waypoint.find(params[:waypoint_id])
    if @waypoint.present?
      @trek = @waypoint.treks.create(trek_params)
      if @trek.valid?
        flash[:success] = "trek successfully created"
        redirect_to current_user
      else
        flash[:danger] = "whoops, something went wrong"
        render 'new'
      end
    end
  end

  def edit
    @trek = Trek.find(params[:id]) 
  end

  def update
    
  end

  def destroy 

  end

  private
    def trek_params
      params.require(:trek).permit(:title, :description, :coverphoto)
    end
end