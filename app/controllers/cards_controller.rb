class CardsController < ApplicationController

  def index
  end

  def new
    @card = Creditcard.new()
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @creditcard = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjpToken])
    redirect_to root_path unless @creditcard.save
  end

  def destroy
  end

end
