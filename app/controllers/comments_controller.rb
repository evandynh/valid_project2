class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
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
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    redirect_to user_post_path(current_user, @post) if current_user != @comment.user
  end

  def update
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(current_user, @post)
  end

private
  def comment_params
    params.require(:comment).permit(:description)
  end

end
