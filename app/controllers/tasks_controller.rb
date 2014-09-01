class TasksController < ApplicationController

  #all the tasks
  def index
    @task = Task.all
    respond_to do |format|
      format.html {}
      # send back the tasks which are associated with the current pub chalenge id
      format.json { render :json => @tasks.where(:pub_challenge_id => :pub_challenge_id) }
    end
  end

  def new
    @task = Task.new
    render :json => @task
  end

  #cr
  def create
    @task = Task.new task_params
    @task.pub_challenge_id = PubChallenge.last.id
    if @task.save
      render :json => @task
    else
      render :json => {:errors => @task.errors}
    end
  end


  def show
    @task = Task.find params[:id]
    render :json => @task
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
  end

    private
      def task_params
      params.permit(:task)
      end

end