class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def active
    @users = User.active
    render action: :index
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Please ensure that you are giving your name and a unique email."
      redirect_to new_user_url
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      flash[:message] = "You must be logged in to see this page. Do you want to create a new profile?"
      redirect_to new_user_url
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :email
    )
  end
end
