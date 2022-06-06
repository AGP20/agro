class AddressesController < ApplicationController
  before_action :set_address, except: [:index, :new, :create]
  def show
    authorize @address
  end

  def new
    @address = Address.new
    @user = current_user
    authorize @address
  end

  def create
    @address = Address.new(list_params)
    @address.user = current_user
    authorize @address
    if @address.save!
      redirect_to user_address_path(@address.user,@address)
    else
      render :new
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def list_params
    params.require(:address).permit(:city,:number,:street,:neighborhood,:cep)
  end
end
