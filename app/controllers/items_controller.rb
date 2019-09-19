class ItemsController < ApplicationController
  
  def index
    @itemCategory1 = Item.where(category_id: 1).includes(:pictures).limit(10).order('id DESC')
    @itemCategory2 = Item.where(category_id: 2).includes(:pictures).limit(10).order('id DESC')
    @itemCategory3 = Item.where(category_id: 3).includes(:pictures).limit(10).order('id DESC')
    @itemCategory4 = Item.where(category_id: 4).includes(:pictures).limit(10).order('id DESC')
  end

  def new
    @item = Item.new
    @user = User.find(params[:user_id])
  end
  
  def show
  end
  
end