class PubChallengesController < ApplicationController

  def new
    @pub_challenge = PubChallenge.new
  end

  #create new user: sign up code
  def create
    @pub_challenge = PubChallenge.new pub_challenge_params
    @pub_challenge.pub_id = @current_pub.id
    if @pub_challenge.save
      render :json => @pub_challenge
    else
      render :json => {:errors => @pub_challenge.errors}
    end
  end

  def update
    @pub_challenge = PubChallenge.find params[:id]
    @pub_challenge.update pub_params
    render :json => @pub_challenge
  end

  #show individual users while signed in as current user
  def show
    # @pub_challenge = PubChallenge.where(:name => params[:id]).first
    @pub_challenge = PubChallenge.find params[:id]
  end


  #current users page.
  def index
    @pub_challenges = PubChallenge.all
    # @pub_challenges = @current_pub.pub_challenges
    respond_to do |format|
      format.html {}
      format.json { render :json => @pub_challenges }
    end
  end

  #il get this to work later...
  def destroy
  end

  private
  def pub_challenge_params
    params.permit(:name, :image, :description, :badge, :point_value)
  end

end
