class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    
    render :layout => 'sub'
  end
  
  def show
  end
  
end