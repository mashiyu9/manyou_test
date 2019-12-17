class ApplicationController < ActionController::Base

  # before_action :basic
  protect_from_forgery with: :exception
  include SessionsHelper

  def basic
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV["TESTUSER"] && password == ENV["TESTPASS"]
    end
  end
end
