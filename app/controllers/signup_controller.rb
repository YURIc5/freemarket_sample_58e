class SignupController < ApplicationController
  layout 'sub'
  def member
    # 新規インスタンス作成
    @user = User.new
  end

  def phone
    # memberで入力された値をsessionに保存
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
      session[:name] = user_params[:name]
      session[:name_kana] = user_params[:name_kana]
      session[:birthday] = user_params[:birthday]
    # 新規インスタンス作成
    @user = User.new
  end

  def create
    # SNS認証
    if session[:uid].present? && session[:provider].present?
      password = Devise.friendly_token.first(7)
      @user = User.new(
        nickname: session[:nickname], 
        email: session[:email],
        password: password,
        password_confirmation: password,
        name: session[:name], 
        name_kana: session[:name_kana],
        birthday: session[:birthday],
        provider: session[:provider],
        uid: session[:uid],
        phone_number: params[:user][:phone_number]
      )
    else
    # email登録
      @user = User.new(
        nickname: session[:nickname], 
        email: session[:email],
        password: session[:password],
        password_confirmation: session[:password_confirmation],
        name: session[:name], 
        name_kana: session[:name_kana],
        birthday: session[:birthday],
        phone_number: params[:user][:phone_number]
      )
    end
    if @user.save
    # ログインするための情報を保管
      session[:id] = @user.id
      sign_in(@user)
      redirect_to new_user_address_path(session[:id])
    else
      render '/users/signup'
    end
  end
  
  private
    # 許可するキーを設定
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :name, 
      :name_kana,
      :birthday, 
      :phone_number
    )
  end
end
