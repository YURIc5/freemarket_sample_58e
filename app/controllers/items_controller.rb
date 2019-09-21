class ItemsController < ApplicationController
  
  def index
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
    binding.pry

    params[:pictures][:name].each do |image|
      item.pictures.build(name: image, item_id: item.id)
    end
    # binding.pry
    # item.save
    # item = Item.create(name: item_params[:name], description: item_params[:description], status: item_params[:status], responsibility: item_params[:responsibility], location: item_params[:location], day: item_params[:day], price: item_params[:price], category_id: @category.id, user_id: @user.id)
    # binding.pry
    item.save
    # @picture = Picture.new(picture_params).merge(item_id: item.id)
    # @picture.save
    binding.pry
    redirect_to new_item_path(@item)
  end


  private

  def item_params
    @user = User.find(1)
    # @category = Category.find(1)
    params.require(:item).permit(
      :name, 
      :description, 
      :status, 
      :responsibility, 
      :location, 
      :day, 
      :price, 
      :category_id,
      pictures_attributes: [:name]).merge(user_id: @user.id)
      # pictures_attributes:[:name]).merge(user_id: @user.id)
      # pictures_attributes:[:id, :name, :item_id]).merge(user_id: @user.id)

      # pictures_attributes: [:name]).merge(user_id: @user.id)
      # .merge(category_id: @category, user_id: @user.id)
      # pictures_attributes: [:"0"][ :name ])
    
  end

  def picture_params
    params.require(:item).permit(pictures_attributes:[:name])
  end
end

