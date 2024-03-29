class Admin::UsersController < Admin::AdminController
  def new
  	@user = User.new
    render 'users/new'
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

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_users_path, 
          notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @form_url = admin_user_path
    render 'users/edit'
  end

  def show
    @user = User.find(params[:id])
    @edit_user_path = edit_admin_user_path(@user)
    render 'users/show'
  end

  def index
  	@users = User.all
    render 'users/index'
  end
end
