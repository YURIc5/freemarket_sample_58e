class ApplicationController < ActionController::Base
    before_action :basic_auth, if: :production?
    protect_from_forgery with: :exception
    layout :layout_by_resource

    private

    def production?
        Rails.env.production?
    end

    def basic_auth
        authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
        end
    end

    # サブクラスからも読み込めるようにprotectedで指定した。
    protected
    # 下記は、メインのフッダーとヘッダー以外を適用したい場合に使用する。
    def layout_by_resource
      if devise_controller?
        "sub_application"
      else
        "application"
      end
    end
end
