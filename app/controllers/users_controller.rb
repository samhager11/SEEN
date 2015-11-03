class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to addresses_new_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  #only allow whitelisted fields to be populated and passed
  def user_params
    params.require(:user).permit(:name,:phone_number,:password_digest)
  end

end
