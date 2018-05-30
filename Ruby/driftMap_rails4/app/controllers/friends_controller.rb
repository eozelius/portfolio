class FriendsController < ApplicationController
  def new
    @friend = Friend.new
  end

  def create
    @waypoint = Waypoint.find(params[:waypoint_id])
    if @waypoint.present?
      @friend = @waypoint.friends.create(friendly_params)
      if @friend.valid?
        @friend.visible = true

        #email = Friend.find_by @friend.email
        #if email.nil? 
        #  send email an awesome invitition to use driftmaps.com
        #end


        flash[:success] = "friend successfully created"
        redirect_to current_user
      else
        flash[:danger] = "whoops, something went wrong" 
        render 'new'
      end
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update

  end

  private
    def friendly_params
      params.require(:friend).permit(:first_name, :last_name, :email, :photo, :description, :x, :y, :member, :visible)
    end
end

#w.friends.build(first_name: 'asdf', last_name: 'asdf', photo: open("http://localhost:3000/uploads/waypoint_image/image/1/open-uri20170308-5976-mio3ht"), description: 'asdf', x: 100, y: 100, member: false, visible: true)