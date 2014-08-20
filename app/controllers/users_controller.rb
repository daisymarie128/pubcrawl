class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_if_logged_in, :except => [:new, :create, :follow, :unfollow, :index]
  #before_action :check_if_admin, :only => [:index]

  def new
    @user = User.new
    render :json => @user
  end

  #create new user: sign up code
  def create
    # binding.pry
    @user = User.new user_params
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      render :json => @user
    else
      render :json => {:errors => @user.errors}
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update user_params
    render :json => @user
  end

  #show individual users while signed in as current user
  def show
    @user = User.where(:username => params[:id]).first
  end


  #current users page.
  def index
    @users = User.all
    respond_to do |format|
      format.html {}
      format.json { render :json => @users }
    end
  end

  #il get this to work later...
  def destroy
  end

  #this is to add people to follow.
  #push to friend into the current users friends.
  def follow
    follow = User.where(:username => params[:id]).first
    @current_user.friends << follow
    redirect_to user_path( follow.username )
  end

  #this shit still confuses me. but this destroys the friendship without actually destroying the friend itself.
  def unfollow
    unfollow = User.where(:username => params[:id]).first
    relationship = @current_user.followers.where( :friend_id => unfollow.id ).first
    relationship.destroy
    redirect_to user_path( unfollow.username )
  end

  #display the users firens
  def following
    @following = @current_user.friends
  end

  #display followers where the friend belongs to the user
  def followers
    @followers = Follower.where(:friend_id => @current_user.id)
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :username, :email , :avatar , :location , :score , :password, :password_confirmation)
  end

  #chech if the user is logged in. show only their stuff
  #loads the smart navs
  def check_if_logged_in
    redirect_to(new_user_path) if @current_user.nil?
  end

  #loads the smart navs
  def check_if_admin
    redirect_to(root_path) unless @current_user.is_admin?
  end

end
