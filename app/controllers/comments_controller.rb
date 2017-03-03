class CommentsController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update]
  before_action :set_post, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = @user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def edit
    redirect_to user_post_path(current_user, @post) if current_user != @comment.user
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_post_path(current_user, @post)
  end

private
  def comment_params
    params.require(:comment).permit(:description)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
      @comment = Comment.find(params[:id])
  end

  def set_user
    @user = current_user
  end

end
