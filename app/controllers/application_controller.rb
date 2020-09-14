class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #デバイスで作成した以外のカラムのみを記載する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname, :lastname, :f_name_read, :l_name_read, :birthday])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
