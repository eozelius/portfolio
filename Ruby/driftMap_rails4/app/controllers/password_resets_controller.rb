class PasswordResetsController < ApplicationController
  before_action :get_user,          only: [:edit, :update]
  before_action	:valid_user,        only: [:edit, :update]
  before_action :check_expiration,  only: [:edit, :update]
  
  # /forgot_password
  def new
  end

  def create
  	@user = User.find_by(email: params[:password_resets][:email].downcase)
  	if @user
  		@user.create_password_reset_digest
  		@user.send_password_reset_email
  		flash[:info] = "A password reset email has been send to #{@user.email}"
  		redirect_to root_url
  	else
  		flash[:danger] = "Email does not exist"
  		render 'new'
  	end
  end

  # /reset_password
  def edit
  end

  def update
    if params[:user][:password].empty?
      flash.now[:danger] = "Password can not be empty"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password reset successfully"
      redirect_to @user
    else
      flash.now[:danger] = "whoops, something went gone, please try again."
      render 'edit'
    end        
  end

  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

  	def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      # if any of these fail, goto root
      if !@user || !@user.authenticated?(:reset, params[:id])
        flash[:danger] = "whoops something went wrong, please try again."
        redirect_to root_url
      end
    end 

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired"
        redirect_to new_password_reset_path
      end
    end       
end

