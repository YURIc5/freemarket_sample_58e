class ItemsController < ApplicationController
  
  def index
    @itemCategory1 = Item.recent1
    @itemCategory2 = Item.recent2
    @itemCategory3 = Item.recent3
    @itemCategory4 = Item.recent4
  end

  def new
    @item = Item.new
    @user = User.find(params[:user_id])

    @parents = Category.all.order("id ASC").limit(14)
  end
  
  def show
  end
  
end