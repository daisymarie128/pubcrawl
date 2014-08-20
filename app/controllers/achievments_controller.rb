class AchievmentsController < ApplicationController


  def index
    #@works = Work.all
    @achievments = @current_user.achievments
  end

  def new
    @achievment = Achievment.new
  end

  def create
    @achievment = Achievment.new work_params
    @achievment.user_id = @current_user.id
    @achievment.save
    redirect_to works_path
  end

  def welcome
  end

  def like
    # raise params.inspect
    @achievment = Achievment.find params[:id]
    @achievment.likes.new
    @achievment.save
    # #MOST OF THIS SHIT IS WRONG DELETE IT (next three lines)
    # @likes = []
    # @liker = @current_user
    # @likes << @liker
    # @work.likes +=1
    # @work.save
    # @like = nil
    # @like = @like + 1
    # @likes = like.count
    redirect_to '/explore'
  end


  def show
    @achievment = Achievment.find params[:id]

  end

  def destroy
    @achievment = Achievment.find params[:id]
    @achievment.destroy
    redirect_to works_path
  end

    private
    def work_params
    params.require(:achievment).permit(:pub_challenges)
    end

end
