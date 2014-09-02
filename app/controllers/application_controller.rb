class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :set_headers

  skip_before_action :verify_authenticity_token#, :if =>lambda{ params[:api_key].present?}
  protect_from_forgery with: :exception
  # protect_from_forgery :except => :create
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

  def set_headers
    if request.headers["HTTP_ORIGIN"]
    # better way check origin
    # if request.headers["HTTP_ORIGIN"] && /^https?:\/\/(.*)\.some\.site\.com$/i.match(request.headers["HTTP_ORIGIN"])
      headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
      headers['Access-Control-Max-Age'] = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end

end