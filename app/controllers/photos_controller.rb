class PhotosController < ApplicationController
  def index
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(post_params)
    if @photo.save
      redirect_to '/'
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
    params.require(:photo).permit(:url,:description,:user,:address)
  end
end
