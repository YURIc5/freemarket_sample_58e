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

  private
  # 許可するキーを設定します
  def address_params
    params.require(:address).permit(
      :postcode, 
      :prefecture, 
      :city, 
      :block, 
      :building
    )
  end

end
