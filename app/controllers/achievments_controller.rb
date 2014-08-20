class AchievmentsController < ApplicationController


  def index
    @achievments = @current_user.achievments
  end

  def new
    @achievment = Achievment.new
  end

  def create
    @achievment = Achievment.new achievment_params
    @achievment.user_id = @current_user.id
    @achievment.save
  end

  def welcome
  end

  def like
    # raise params.inspect
    @achievment = Achievment.find params[:id]
    @achievment.likes.new
    @achievment.save
  end


  def show
    @achievment = Achievment.find params[:id]

  end

  def destroy
    @achievment = Achievment.find params[:id]
    @achievment.destroy
  end

    private
    def achievment_params
    params.require(:achievment).permit(:pub_challenges)
    end

end
