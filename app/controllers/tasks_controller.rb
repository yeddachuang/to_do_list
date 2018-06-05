class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_url
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    param.require(:task).permit(:name, :due_date, :note)
  end
end
