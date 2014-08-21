class TasksController < ApplicationController


  def index
    @tasks = @pub_challenge.tasks
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