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
    @user = User.find(1)
    @address = Address.new(address_params)
  end

  private
  def address_params
    
  end
end
