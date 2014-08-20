class AchievementsController < ApplicationController


  def index
    @achievements = @current_user.achievements
  end

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new achievement_params
    @achievement.user_id = @current_user.id
    @achievement.save
  end

  def welcome
  end

  def like
    # raise params.inspect
    @achievement = Achievement.find params[:id]
    @achievement.likes.new
    @achievement.save
  end


  def show
    @achievement = Achievement.find params[:id]

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
