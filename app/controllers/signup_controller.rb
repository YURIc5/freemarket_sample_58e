class SignupController < ApplicationController

  # 各アクションごとに新規インスタンスを作成します
  # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:name] = user_params[:name]
    session[:name_kana] = user_params[:name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end
  
  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      name: session[:name], 
      name_kana: session[:name_kana],
      birthday: session[:birthday],
      phone_number: params[:user][:phone_number]

    )
    if @user.save
    # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to new_user_address_path
    else
      render '/addresses/new'
    end
  end
  
  private
  # 許可するキーを設定します
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
