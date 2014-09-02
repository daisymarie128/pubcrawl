class PubsController < ApplicationController

  skip_before_action :verify_authenticity_token
  def new
    @pub = Pub.new
  end

  #create new pub: form relateds
  def create
    # binding.pry
    @pub = Pub.new pub_params
    # binding.pry
    @pub.username = @pub.username.downcase
    if @pub.save
      render :json => @pub
    else
      render :json => {:errors => @pub.errors}
    end
  end

  def update
    @pub = Pub.find params[:id]
    @pub.update pub_params
    render :json => @pub
  end

  #show single pub while signed in as current user
  def show
    @pub = Pub.where(:username => params[:id]).first
  end


  # all pub page.
  def index
    @pubs = Pub.all
    respond_to do |format|
      format.html {}
      format.json { render :json => @pubs }
    end
  end


  private
  def pub_params
    params.require(:pub).permit(:name, :username, :email, :password, :password_confirmation, :address, :image, :image_cache, :description)
  end

end
