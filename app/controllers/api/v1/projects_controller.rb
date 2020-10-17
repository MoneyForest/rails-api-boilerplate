class Api::V1::ProjectsController < Api::V1::ApplicationController
  before_action :set_project, only: %i[show update destroy]

  def index
    @projects = Project.preload(:teams_project, :team, :tasks_project, :task, :users_project, :user)
    render json: @projects, each_serializer: ProjectSerializer
  end

  def show; end

  def create
    @project = Project.create!(create_params.merge(is_archived: 0))
    render json: @project, serializer: ProjectSerializer
  end

  def update
    @project.update!(update_params)
    render json: @project, serializer: ProjectSerializer
  end

  def destroy
    @project.destroy!
    render json: @project, serializer: ProjectSerializer
  end

  private

  def create_params
    params.permit(
      :name,
      :description
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
    @project = Project.find(params[:id])
  end
end
