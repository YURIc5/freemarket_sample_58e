class AddressesController < ApplicationController
  layout 'sub'
  def new
    @user = User.find(params[:user_id])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      session[:id] = params[:user_id]
      redirect_to new_user_card_path(session[:id])
    else
      render '/users/signup'
    end
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
      :prefecture_id,
      :city, 
      :block, 
      :building,
    ).merge(user_id: params[:user_id])
  end

end
