class UsersController < ApplicationController
  before_action :set_user

  def signup
    render layout:'sub'
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


  private

  def set_user
    @user = User.find(params[:id])
  end

end
