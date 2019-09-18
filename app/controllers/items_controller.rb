class ItemsController < ApplicationController
  
  def index
    @items = Item.find(1).pictures
  end

  def new
    @item = Item.new
    @user = User.find(params[:user_id])
  end
  
  def show
  end
  
end