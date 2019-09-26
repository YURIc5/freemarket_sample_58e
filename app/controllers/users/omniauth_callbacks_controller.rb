# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end
  
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_for_oauth(request.env["omniauth.auth"])
    provider = @user[:provider]
    uid = @user[:uid]
    email = @user[:email]
    name = @user[:name]
    password = @user[:password]
    password_confirmation = @user[:password]

    #DBに保存済かどうかを判定する
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
        session[:email] = @user[:email]
        session[:password] = @user[:password]
        session[:password_confirmation] = @user[:password]
        session[:name] = @user[:name]
        session[:provider] = @user[:provider]
        session[:uid] = @user[:uid]
        @user = User.new
      render '/signup/member'
    end
  end

  def failure
    redirect_to root_path
  end
end
