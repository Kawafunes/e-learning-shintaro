class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.order(created_at: :desc).paginate(page: params[:page], per_page: 6rails)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "Registerd new user"
      redirect_to login_url
    else
      flash.now[:danger] = 'Failed to sign-up'
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Changed your information"
      redirect_to @user
    else
      flash.now[:danger] = 'Failed to sign-up'
      render "edit"
    end
  end

  def index
  # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
