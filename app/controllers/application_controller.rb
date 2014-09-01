class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :cors_preflight_check
  before_action :cors_set_headers
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

  def cors_set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = '*'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end

end