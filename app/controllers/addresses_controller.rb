class AddressesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @address = Address.new
  end

  def create
    @address = Adress.new(address_params)
  end

  def edit
    @user = User.find(params[:user_id])
    @address = Address.new
  end

end
