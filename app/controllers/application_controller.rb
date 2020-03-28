class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  def production?
    Rails.env.production?
  end

  # Basic認証
  def basic_auth 
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def after_sign_in_path_for(resource)
    root_url
  end
  
  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
end
