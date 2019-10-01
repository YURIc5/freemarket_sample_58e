class UsersController < ApplicationController

  def signup
  end

  def phone
    @user = User.new()
  end

  def index
  end

  def profile
  end

  def logout
  end

  def information
    @user = User.find(params[:id])
    @address = Address.new
  end

  def exhibit_list
    @user = User.find(params[:id])
    @items = Item.where(user_id: current_user.id)
  end
end
