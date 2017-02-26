class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      session[:user_id] = @user.id.to_s
      redirect_to user_path(@user)
    else
      flash.now.alert = 'Invalid login credentials - try again!'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :first_name, :last_name, :skills, :years_of_experience)
  end
end