class AchievementsController < ApplicationController


  def index
    @achievements = @current_user.achievements
    render :json => @achievement
  end

  def new
    @achievement = Achievement.new
    render :json => @achievement
  end

  #create a new achievment and add it to the current user
  #check then set the acheivments pub challenge id to the current pub challenge
  def create
    @achievement = Achievement.new achievement_params
    @achievement.user = @current_user.id
    @achievement.pub_challenge = params[:id]
    if @achievement.save
      render :json => @achievement { status: 'ok'}
    else
      render :json => {:errors => @achievement.errors}
    end
  end

  def show
    @achievement = Achievement.find params[:id]
    render :json => @achievement

  end

  def destroy
    @achievement = Achievement.find params[:id]
    @achievement.destroy
  end

  private
    def achievement_params
    params.require(:achievement).permit(:pub_challenges)
  end

end
