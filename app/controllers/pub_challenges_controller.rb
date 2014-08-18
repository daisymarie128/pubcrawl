class PubChallengesController < ApplicationController

  def new
    @pub_challenge = PubChallenge.new
  end

  #create new user: sign up code
  def create
    @pub_challenge = PubChallenge.create({:name => params[:name], :image => params[:image], :description => params[:description], :badge => params[:badge]})
    render :json => @pub_challenge
  end

  def update
    @pub_challenge = PubChallenge.find params[:id]
    @pub_challenge.update pub_params
    render :json => @pub_challenge
  end

  #show individual users while signed in as current user
  def show
    @pub_challenge = PubChallenge.where(:name => params[:id]).first
  end


  #current users page.
  def index
    @pub_challenges = PubChallenge.all
    respond_to do |format|
      format.html {}
      format.json { render :json => @pub_challenges }
    end
  end

  #il get this to work later...
  def destroy
  end

  private
  def pub_params
    params.require(:pubs).permit(:name, :image, :image_cache, :description, :badge)
  end

end
