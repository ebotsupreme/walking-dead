class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
    @post = post_id
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
