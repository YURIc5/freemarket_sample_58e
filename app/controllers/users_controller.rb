class UsersController < ApplicationController

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
    # @user = User.new()
  end

end
