class SessionController < ApplicationController

  # before_action :check_if_logged_in, :except => [:new, :create, :follow, :unfollow]
  # before_action :check_if_admin, :only => [:index]
  # curl --data "username=pjs&password=p" http://fierce-river-3029.herokuapp.com/session

  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    # binding.pry
    # raise params.inspect
    #user sign in.
    #creates new session.
    result = nil
    user = User.find_by(:username => params[:username])
    pub = Pub.find_by(:username => params[:username])
    # binding.pry
    if (user.present? || pub.present?) && (user.try(:authenticate,(params[:password])) || pub.try(:authenticate, (params[:password])))
      if user.try(:authenticate,(params[:password]))
        session[:user_id] = user.id
        result = user
        type = :user
      end
      if pub.try(:authenticate, (params[:password]))
      session[:user_id] = pub.id
      # binding.pry
      result = pub
      type = :pub
      end
    else
      user = nil
      type = :invalid
    end
    @current_user = (user || pub)
    # binding.pry
    render :json => {
      :user => result,
      :type => type
    }
  end

  def destroy
    session[:user_id] = nil
    render :text => 'log out'
  end

  private

    #chech if the user is logged in. show only their stuff
    #loads the smart navs
    def check_if_logged_in
      redirect_to(new_user_path) if @current_user.nil?
    end

    def check_if_pub
      redirect_to(root_path) unless @current_user.is_pub?
    end

    #loads the smart navs
    #^^ should this be changed I dont fucking know
    def check_if_admin
      redirect_to(root_path) unless @current_user.is_admin?
    end
end