class AddressesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @address = Address.find_by(id: (params[:user_id]))
  end
end
