class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = Comment.new
  end

  def new
    if current_user
      @post = Post.new
    else
      redirect_to users_new_path
    end
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
    @post = Post.find(params[:id])
    @user = User.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path({id: params[:id]})
    else
      render '/'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to("/")
    else
      render 'show'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end
end
