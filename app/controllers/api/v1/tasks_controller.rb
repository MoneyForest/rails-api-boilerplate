class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :set_task, only: %i[show update destroy]

  def index
    users_task = current_user.users_task
    @tasks = Task.where(id: users_task.pluck(:task_id))
  end

  def show; end

  def create
    @task = Task.create!(create_params.merge(created_user_id: current_user.id))
  end

  def update
    @task.update!(update_params)
  end

  def destroy
    @task.destroy!
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
    users_task = current_user.users_task.find_by!(task_id: params[:id])
    @task = Task.find(users_task.task_id)
  end
end
