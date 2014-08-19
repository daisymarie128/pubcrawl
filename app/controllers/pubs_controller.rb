class PubsController < ApplicationController

  def new
    @pub = Pub.new
  end

  #create new user: sign up code
  def create
    # binding.pry
    @pub = Pub.new pub_params
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

  #show individual users while signed in as current user
  def show
    @pub = Pub.where(:username => params[:id]).first
  end


  #current users page.
  def index
    @pubs = Pub.all
    respond_to do |format|
      format.html {}
      format.json { render :json => @pubs }
    end
  end

  #il get this to work later...
  def destroy
  end

  private
  def pub_params
    params.permit(:name, :email, :password, :address, :image, :description)
  end

end
