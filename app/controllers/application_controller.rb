class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def production?
    Rails.env.production?
  end

  # Basic認証
  def basic_auth 
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :familyname, :firstname, :firstname_kana, :familyname_kana, :birth_year, :birth_month, :birth_day, :phone_number] )
  end
  
  # private
    # def sign_in_required
    #   redirect_to new_user_session_url unless user_signed_in?
    # end
end
