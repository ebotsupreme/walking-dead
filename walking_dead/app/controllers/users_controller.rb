class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
