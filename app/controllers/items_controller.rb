class ItemsController < ApplicationController
  before_action :set_user, onry: [:new]

  def index
  end

  def new
    @item = Item.new
    @categories = Category.all.name
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
