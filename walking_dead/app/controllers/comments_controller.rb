class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
    @post = Post.find(params[:id])
  end

  def create
    @comment = Comment.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit([:body])
  end
end
