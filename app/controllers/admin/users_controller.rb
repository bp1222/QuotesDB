class UsersController < ApplicationController
  def index
    @users = User.order(username: :asc).page params[:page]
  end

  def new
    @user = User.new
    @header = 'New User'
    render 'form'
  end

  def create
    @user = User.create user_params
    redirect_to users_path, {flash: {success: "Record has been created"}}
  end

  def edit
    @user = User.find params[:id]
    @header = @user.name 
    render 'form'
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      redirect_to users_path
    else
      render 'form'
    end
  end

  def destroy
    User.destroy params[:id]
    redirect_to users_path, {flash: {notice: "Record has been deleted"}}
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
