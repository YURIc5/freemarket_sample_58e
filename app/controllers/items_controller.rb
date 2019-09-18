class ItemsController < ApplicationController

  
  def index
  end

  def new
    @user = User.find(params[:user_id])
    @item = Item.find(params[:user_id])
    # @items = @user.pictures.includes(:user)
    10.times { @item.pictures.build }
    binding.pry
  end
  
  def show
  end

  def create
    @picture = @picture.new
  end

  private
    def set_group
      @picture = Picture.find(params[:item_id])
    end
end