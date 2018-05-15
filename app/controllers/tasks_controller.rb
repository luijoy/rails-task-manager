class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def find
    @task = Task.find(params[:id])
  end

  def new
    # initialize a new instance to pass it to the new form
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to task_path(task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # find the restaurant
    # @restaurant = Restaurant.find(params[:id]) => set_restaurant before_action
    # update the restaurant's attributes
    @task = Task.find(params[:id])
    @task.update(task_params)
    # redirect to the restaurant show view
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # redirecting to the index
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
