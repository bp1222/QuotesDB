class UsersController < ApplicationController
  before_action :check_rights, except: [:index, :show]

  def index
    @users = User.order(username: :asc).page params[:page]
  end

  def new
    @user = User.new
    @header = 'New User'
    render 'form'
  end

  def register
    @user = User.new
    @header = 'New Registration'
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

  def show
    @user = User.find params[:id]
    @header = @user.name 
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
    redirect_to users_path, {flash: {info: "Record has been deleted"}}
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :role_ids => [])
  end

  def check_rights
    unless has_right?("user_#{self.action_name}")
      flash[:danger] = "You do not have rights for this action"
      redirect_to users_path
    end
  end
end
