class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to tasks_path, :notice => "User not found" 
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:noticed] = "You are now registered!"
  		sign_in @user
  		redirect_to root_url
  	else
  		flash[:alert] = "Invalid email/password"
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
  	end
end
