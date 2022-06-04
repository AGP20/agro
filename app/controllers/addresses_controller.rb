class AddressesController < ApplicationController
  def new
    @address = Address.new
    authorize @address
  end

  

end
