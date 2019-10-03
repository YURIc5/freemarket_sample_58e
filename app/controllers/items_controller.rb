class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :destroy, :buy, :pay, :update, :edit, :stop, :start]
  before_action :authenticate_user!, only: [:new, :buy]
  
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

    render layout:'sub'

  end
  
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

   # 子カテゴリーが選択された後に動くアクション
   def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end

  def get_delivery_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @delivery_children = Delivery.find_by(responsibility: "#{params[:parent_name]}", ancestry: nil).children
  end

 

  def show
    @pictures = Picture.where(item_id: @item.id).limit(4)
  end

  def edit
    
    @category_parent_array = ['---']
    # #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).map{|parent| @category_parent_array << parent.name}
    @category_children = @item.category.parent.parent.children
    @category_grandchildren = @item.category.parent.children
    @delivery_parent_array = ['---']
    Delivery.where(ancestry: nil).map{|parent| @delivery_parent_array << parent.responsibility}
    @delivery_children = @item.delivery.parent.children
    render :layout => 'sub'
  end

  def update
    # もしピクチャーが何も変更されていなければ
    if params[:pictures] == nil
      # アイテムの変更のみ保存
      @item.update(update_params)
      redirect_to root_path
      # ピクチャーが変更されていれば
    elsif params[:pictures] != nil
      @item.update(item_params)
      # 一旦登録されているピクチャーを捨てて
      @item.pictures.destroy_all
      # 新たに写真を登録する
      params[:pictures][:name].each do |image|
        @item.pictures.create(name: image, item_id: @item.id)
        
      end
      redirect_to root_path
    else
      recirect_to edit_item_path
    end
  end


  def create

    @item = Item.new(create_params)
    # もしピクチャーがなければ
    if params[:pictures] == nil
      redirect_to new_item_path
    else
      # 登録された写真を配列から取り出しピクチャーテーブルへ保存
      params[:pictures][:name].each do |image|
        @item.pictures.build(name: image, item_id: @item.id)
      end
      if @item.save
        redirect_to root_path
      else
        redirect_to new_item_path
      end
    end
  end

  def stop

    @item.update(stop: 2)
    redirect_to root_path

  end

  def start
    @item.update(stop: 1)
    redirect_to root_path

  end
  

  

  def destroy
    # ↓ログイン機能実装後コメントアウトを外します
    @item.destroy
    redirect_to controller: 'items', action: 'index'
  end

  

  def buy

    creditcard = current_user.creditcard
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.retrieve(creditcard.customer_id)
    @creditcard_last4 = customer[:cards][:data][0]["last4"]
    @creditcard_exp_month = customer[:cards][:data][0]["exp_month"].to_s
    @creditcard_exp_year = customer[:cards][:data][0]["exp_year"].to_s.slice(2,3)
    @creditcard_brand = customer[:cards][:data][0]["brand"]

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


  def create_params
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
      pictures_attributes: [:name]).merge(user_id: current_user.id, stop: 1)
  end

  def item_params
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
      pictures_attributes: [:name, :id]).merge(user_id: current_user.id)
  end

  def update_params
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
      :brand).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end

