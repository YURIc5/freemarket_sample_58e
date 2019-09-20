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
    
    # item = Item.create(item_params)
    item = Item.create(name: item_params[:name], description: item_params[:description], status: item_params[:status], responsibility: item_params[:responsibility], location: item_params[:location], day: item_params[:day], price: item_params[:price], category_id: @category.id, user_id: @user.id)
    item.save

    redirect_to new_item_path(@item)
  end

end

private

def item_params

  # params.permit(:name, :description, :status, :responsibility, :location, :day, :price, :category_id)

  params.require(:item).permit(
    :name, 
    :description, 
    :status, 
    :responsibility, 
    :location, 
    :day, 
    :price, 
    :category_id,
    pictures_attributes: [:name])
    # pictures_attributes: [:"0"][ :name ])
  
end