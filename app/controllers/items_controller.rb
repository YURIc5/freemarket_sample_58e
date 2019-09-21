class ItemsController < ApplicationController
  
  def index
    @itemCategory1 = Item.recent1
    @itemCategory2 = Item.recent2
    @itemCategory3 = Item.recent3
    @itemCategory4 = Item.recent4
  end

  def new
    @item = Item.new
    @item.pictures.build
    render :layout => 'sub'
  end
  
  def show
  end

  def create
    @category = Category.find(1)
    @user = User.find(1)
  
    item = Item.new(item_params)

    params[:pictures][:name].each do |image|
      item.pictures.build(name: image, item_id: item.id)
    end
    item.save
    
    redirect_to new_item_path(@item)
  end


  private

  def item_params
    @user = User.find(1)
    params.require(:item).permit(
      :name, 
      :description, 
      :status, 
      :responsibility, 
      :location, 
      :day, 
      :price, 
      :category_id,
      :prefecture_id,
      pictures_attributes: [:name]).merge(user_id: @user.id)
      
    
  end

  def picture_params
    params.require(:item).permit(pictures_attributes:[:name])
  end
end

