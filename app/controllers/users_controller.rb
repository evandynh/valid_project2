class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.order("id ASC")
    redirect_to root_path(current_user) if current_user.nil? || !current_user.admin
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.username.downcase!
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      session[:user_id] = @user.id.to_s
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :profile_pic, :email, :first_name, :last_name, :years_of_experience, :skills)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
