class PhotosController < ApplicationController
  def index
    @user = User.find(current_user)
    @user_city = @user.address.city
    @photos = Photo.where(:city => @user_city)
  end

  def show
    @photos = Photo.where(:user_id => current_user)
    @photo = Photo.where(:id => params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      flash[:notice] = "Successfully added photo!"
      redirect_to photo_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @photos = Photo.all
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      flash[:notice] = "Successfully updated photo."
      redirect_to photo_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy

    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully deleted photo."
    redirect_to photo_path(current_user)
  end

  private
  def photo_params
    params.require(:photo).permit(:url,:image,:description,:user,:address,:city)
  end
end
