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

end
