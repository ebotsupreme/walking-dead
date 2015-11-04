class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path({id: params[:post_id]})
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path({id: params[:post_id]})
    else
      render '/'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to post_path({id: params[:post_id]})
    else
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit([:body])
  end
end
