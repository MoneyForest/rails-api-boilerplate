class Api::V1::TeamsController < Api::V1::ApplicationController
  before_action :set_team, only: %i[show update destroy]

  def index
    @teams = Team.preload(:teams_project, :project, :users_team, :user)
    render json: @teams, each_serializer: TeamSerializer
  end

  def show; end

  def create
    @team = Team.create!(create_params.merge(created_user_id: current_user.id))
    render json: @team, serializer: TeamSerializer
  end

  def update
    @team.update!(update_params)
    render json: @team, serializer: TeamSerializer
  end

  def destroy
    @team.destroy!
    render json: @team, serializer: TeamSerializer
  end

  private

  def create_params
    params.permit(
      :name
    )
  end

  def update_params
    params.permit(
      :name
    )
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
