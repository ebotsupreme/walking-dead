class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @reply = Reply.new reply_params
    @reply.user_id = current_user.id
    if @reply.save
      redirect_to post_path({id: params[:post_id]})
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
  def reply_params
    params.require(:reply).permit([:body, :comment_id])
  end

end
