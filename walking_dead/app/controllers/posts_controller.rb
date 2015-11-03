class PostsController < ApplicationController
  def index
    @posts = Post.all
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @current_user = current_user
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new post_params
    @post.user_id = current_user.id
    if @post.save
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
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
