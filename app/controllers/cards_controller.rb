class CardsController < ApplicationController

  def index
  end

  def new
    @card = Card.new()
  end

  def create
    @address = Address.new(address_params)
    redirect_to user_card_path(session[:id])
  end

  def destroy
  end

end
