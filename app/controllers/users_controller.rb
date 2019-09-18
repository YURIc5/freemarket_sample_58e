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

  def buy
    render :layout => 'buy'
  end

  def exhibit_list
    @itemnames = Item.find(1)
    @items = Item.find(1).pictures
    @users = User.all
    @pictures = Picture.find(3)
  end
end
