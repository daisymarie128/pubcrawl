class TasksController < ApplicationController


  def index
    @tasks = @current_user.tasks
  end

  def new
    @task = task.new
  end

  def create
    @task = task.new task_params
    @task.user_id = @current_user.id
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