class PostsController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all.order("updated_at DESC")
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @user.id
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def edit
    redirect_to user_posts_path(current_user) if current_user != @post.user
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :description, :language)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = current_user
  end


end
