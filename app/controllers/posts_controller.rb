class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user_id = @user.id
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
    redirect_to user_posts_path(current_user) if current_user != @post.user
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :description, :language)
  end

end
