class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private
  def authenticate_user
    if session[:user_id].present?
      @current_user = User.where(:id => session[:user_id]).first # Try to find a user but STAY CALM.
      @current_user = Pub.where(:id => session[:user_id]).first unless @current_user
    end

    if @current_user.nil?
      session[:user_id] = nil
    end
  end

end