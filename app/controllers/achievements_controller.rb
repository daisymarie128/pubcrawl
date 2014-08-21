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
  def create
    @achievement = Achievement.new achievement_params
    @achievement.user_id = @current_user.id
    if @achievement.save
      render :json => @achievement
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
