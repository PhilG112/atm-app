class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :fetch_user

  private
  def fetch_user
    @current_user = Customer.find_by(id: session[:customer_id]) if session[:customer_id]
    session[:customer_id] = nil unless @current_user.present?
  end
end
