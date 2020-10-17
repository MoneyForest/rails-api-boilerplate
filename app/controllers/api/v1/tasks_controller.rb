class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :set_task, only: %i[show update destroy]

  def index
    @tasks = Task.preload(:tasks_project, :project, :users_task, :user)
    render json: @tasks, each_serializer: TaskSerializer
  end

  def show; end

  def create
    @task = Task.create!(create_params.merge(created_user_id: current_user.id))
    render json: @task, serializer: TaskSerializer
  end

  def update
    @task.update!(update_params)
    render json: @task, serializer: TaskSerializer
  end

  def destroy
    @task.destroy!
    render json: @task, serializer: TaskSerializer
  end

  private

  def create_params
    params.permit(
      :name,
      :description,
      :description,
      :deadline_at,
      :repeats,
      :parent_task_id,
      :assigned_user_id
    )
  end

  def update_params
    params.permit(
      :name,
      :description,
      :deadline_at,
      :repeats,
      :parent_task_id,
      :assigned_user_id
    )
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
