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
    @address = Address.new(address_params)

    # @address = process_address(@address)
    @address.user = current_user
    if @address.save
        redirect_to user_path(current_user)
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
    params.require(:address).permit(:city,:country,:latitude,:longitude,:user)
  end
end
