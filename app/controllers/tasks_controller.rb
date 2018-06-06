class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :edit, :update, :destroy, :done, :undo]

  def index
    @tasks_undo = Task.where(status: nil).order(:due_date)
    @tasks_done = Task.where(status: true).order(:due_date)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      render  :action => :new
    end
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

  def done
    if @task.due_date > Date.today
      @task.update_column(:status, true)
    end

    redirect_to tasks_url
  end

  def undo
    if @task.due_date > Date.today
      @task.update_column(:status, nil)
    end

    redirect_to tasks_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :note)
  end
end
