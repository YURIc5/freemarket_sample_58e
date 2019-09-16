class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    @user = User.find(params[:user_id])
  end
  
  def show
  end
  
end