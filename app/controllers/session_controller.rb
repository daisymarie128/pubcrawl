class SessionController < ApplicationController

  before_action :check_if_logged_in, :except => [:new, :create, :follow, :unfollow]
  before_action :check_if_admin, :only => [:index]

  def new
  end

  def create
    # raise params.inspect
    #user sign in.
    #creates new session.
    user = User.find_by(:username => params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      render :json => @user
    else
      render :json => {crap: 'hataha' }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  #chech if the user is logged in. show only their stuff
  #loads the smart navs
  def check_if_logged_in
    redirect_to(new_user_path) if @current_user.nil?
  end

  #loads the smart navs
  #^^ should this be changed I dont fucking know
  def check_if_admin
    redirect_to(root_path) unless @current_user.is_admin?
  end
end