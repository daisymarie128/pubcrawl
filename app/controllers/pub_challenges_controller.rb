class PubChallengesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @pub_challenge = PubChallenge.new
    render :json => @pub_challenge
  end

  #create new pub challenge: form related
  # then render that to json data
  def create
    # raise params.inspect
    @pub_challenge = PubChallenge.new pub_challenge_params
    @pub_challenge.pub_id = @current_user.id
    if @pub_challenge.save
      # tasks = JSON.parse params[:tasks]
      # tasks.each do |task|
      #   @task = Task.create :task => task
      #   @pub_challenge.tasks << @task
      # end
      render :json => @pub_challenge, :include => :tasks
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
    params.require(:pub_challenge).permit(:name, :image, :image_cache, :description, :badge, :image_cache, :point_value)
  end

end
