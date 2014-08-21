class TasksController < ApplicationController


  def index
    @task = Task.all
    respond_to do |format|
      format.html {}
      format.json { render :json => @tasks.where(:pub_challenge_id => :pub_challenge_id) }
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    @task.pub_challenge_id = @pub_challenge.id
    @task.save
  end

  def show
    @task = Task.find params[:id]

  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
  end

    private
    def task_params
    params.require(:task).permit(:task_name)
    end

end