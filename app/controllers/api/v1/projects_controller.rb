class Api::V1::ProjectsController < Api::V1::ApplicationController
  before_action :set_project, only: %i[show update edit destroy]

  def index
    users_project = current_user.users_project
    @projects = Project.where(id: users_project.pluck(:project_id))
  end

  def show; end

  def create
    @project = Project.create!(create_params.merge(is_archived: 0))
  end

  def update
    @project.update!(update_params)
  end

  def destroy
    @project.destroy!
  end

  private

  def create_params
    params.permit(
      :name,
      :description,
    )
  end

  def update_params
    params.permit(
      :name,
      :description,
      :is_archived
    )
  end

  def set_project
    users_project = current_user.users_project.find_by!(project_id: params[:id])
    @project = Project.find(users_project.project_id)
  end
end
