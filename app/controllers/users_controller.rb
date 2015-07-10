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
    redirect_to edit_user_path(@user)
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

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
