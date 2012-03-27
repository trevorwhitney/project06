class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "Registration suceeded."
  		redirect_to root_url
  	else
  		render :action => 'new'
  	end
  end

  def edit
  end

  def index
  	@users = User.all
  end
end
