class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  private

  def authenticate
    return true if ENV['API_KEY'].blank?

    authenticate_or_request_with_http_token do |token, options|
      token == ENV['API_KEY']
    end
  end
end
