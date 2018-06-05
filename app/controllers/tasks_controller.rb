class TasksController < ApplicationController
  before_action :set_photo, :only => [:show, :edit, :update, :destroy, :finish]

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

  def update
    if @task.status == nil
      @task.update_attributes(task_params)
      redirect_to task_path(@task)
    end
  end

  def destroy
    if @task.due_date > Date.today
      @task.destroy
    end

    redirect_to tasks_url
  end

  def finish
    @task.status = true
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :note)
  end
end
