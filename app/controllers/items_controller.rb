class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :destroy, :buy, :pay]
  
  def index
    @itemCategory1 = Item.recent1
    @itemCategory2 = Item.recent2
    @itemCategory3 = Item.recent3
    @itemCategory4 = Item.recent4
  end

  def new
    @item = Item.new
    @item.pictures.build

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]

    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).map{|parent| @category_parent_array << parent.name}
  
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
    # ↓ログイン機能実装後コメントアウトを外します
    # @item.destroy if @item.user == current_user
    @item.destroy
    redirect_to controller: 'items', action: 'index'
  end

  def buy
    @address = current_user.address

    creditcard = current_user.creditcard
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.retrieve(creditcard.customer_id)
    @creditcard_last4 = customer[:cards][:data][0]["last4"]
    @creditcard_exp_month = customer[:cards][:data][0]["exp_month"].to_s
    @creditcard_exp_year = customer[:cards][:data][0]["exp_year"].to_s.slice(2,3)
    @creditcard_brand = customer[:cards][:data][0]["brand"]

    render :layout => 'sub'
  end

  def pay
    @item.buyer_id = current_user.id
    @item.save

    creditcard = current_user.creditcard
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => creditcard.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  end

  private

  def item_params
    # @user = current_user
    params.require(:item).permit(
      :name, 
      :description, 
      :status, 
      :day, 
      :price, 
      :category_id,
      :prefecture_id,
      :delivery_id,
      :size,
      :brand,
      pictures_attributes: [:name]).merge(user_id: current_user.id)
  end

  def picture_params
    params.require(:item).permit(pictures_attributes:[:name])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

