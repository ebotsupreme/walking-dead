class PostsController < ApplicationController
  def index
    @posts = Post.all
    @current_user = current_user
  end

  def show
  end

  def new
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
