class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @current_user = current_user
    @address = Address.new(address_params)
    if @address.save && @current_user.update({address_id:@address.id})
        redirect_to users_path
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
  def address_params
    params.require(:address).permit(:city,:country,:latitude,:longitude)
  end
end