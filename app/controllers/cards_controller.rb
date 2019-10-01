class CardsController < ApplicationController

  def index
  end

  def new
    @card = Creditcard.new()
    render layout:'sub'
  end


  def show 
    creditcard = current_user.creditcard
    if creditcard.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      @creditcard_last4 = customer[:cards][:data][0]["last4"]
      @creditcard_exp_month = customer[:cards][:data][0]["exp_month"].to_s
      @creditcard_exp_year = customer[:cards][:data][0]["exp_year"].to_s.slice(2,3)
      @creditcard_brand = customer[:cards][:data][0]["brand"]
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.create(card: params[:payjpToken])
    @creditcard = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjpToken])
    redirect_to root_path unless @creditcard.save
    render layout:'sub'
  end

  def destroy
    creditcard = Creditcard.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.retrieve(creditcard.customer_id)
    customer.delete
    creditcard.delete
    redirect_to action: "new"
  end

end
