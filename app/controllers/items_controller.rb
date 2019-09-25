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

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]

    #データベースから、親カテゴリーのみ抽出し、配列化
    
    Category.where(ancestry: nil).map{|parent| @category_parent_array << parent.name}
  
    @item.pictures.build


    @delivery_parent_array = ["---"]

    Delivery.where(ancestry: nil).map{|parent| @delivery_parent_array << parent.responsibility}


    render :layout => 'sub'
  end
  
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_delivery_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @delivery_children = Delivery.find_by(responsibility: "#{params[:parent_name]}", ancestry: nil).children
  end



  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def show
  end

  def create
    item = Item.new(item_params)

    params[:pictures][:name].each do |image|
      item.pictures.build(name: image, item_id: item.id)
    end
    if item.save
      redirect_to user_items_path
    else
      redirect_to new_user_item_path
    end

  end

  def destroy
    @item = Item.find(params[:id])
    # ↓ログイン機能実装後コメントアウトを外します
    # @item.destroy if @item.user == current_user
    @item.destroy
    redirect_to controller: 'items', action: 'index'
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
      :delivery_id,
      pictures_attributes: [:name]).merge(user_id: @user.id)
  end

  def picture_params
    params.require(:item).permit(pictures_attributes:[:name])
  end
end

