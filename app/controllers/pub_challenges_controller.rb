class PubChallengesController < ApplicationController

  def new
    @pub_challenge = PubChallenge.new
    render :json => @pub_challenge
  end

  #create new pub challenge: form related
  # then render that to json data
  def create
    @pub_challenge = PubChallenge.new pub_challenge_params
    @pub_challenge.pub_id = @current_user.id
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

  #show individual pub challenges
  def show
    # @pub_challenge = PubChallenge.where(:name => params[:id]).first
    @pub_challenge = PubChallenge.find params[:id]
  end


  #current pub challenge page.
  def index
    @pub_challenges = PubChallenge.all
    # @pub_challenges = @current_pub.pub_challenges
    respond_to do |format|
      format.html {}
      format.json { render :json => @pub_challenges, :include => :tasks }
    end
  end

  private
  def pub_challenge_params
    params.permit(:name, :image, :description, :badge, :point_value, :tasks)
  end

end
