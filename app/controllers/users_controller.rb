class UsersController < ApplicationController
  def index

    @user = current_user
    @users = User.all

  end

  def show
    @user = User.find(session[:user_id])



    @users = User.all
    @user_lat = @user.address.latitude
    @user_long = @user.address.longitude


  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_address_path
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
    params.require(:user).permit(:name,:phone_number,:password,:password_confirmation)
  end

end
