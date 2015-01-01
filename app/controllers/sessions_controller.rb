class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by email: params[:email].downcase
  	if user && user.authenticate(params[:password])
  		flash[:notice] = "You are signed in"
  		sign_in user
  		redirect_to root_url
  	else
  		flash.now[:alert] = "Invalid email/password"
  		render 'new'
  	end
  end

  def destroy
  	sign_out
  	flash[:notice] = "You are signed out. Bye!"
  	redirect_to root_url
  end
end
