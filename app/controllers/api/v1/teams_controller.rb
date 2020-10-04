class Api::V1::TeamsController < Api::V1::ApplicationController
  before_action :set_team, only: %i[show update edit destroy]

  def index
    users_team = current_user.users_team
    @teams = Team.where(id: users_team.pluck(:team_id))
  end

  def show; end

  def create
    @team = Team.create!(team_params.merge(created_user_id: current_user.id))
  end

  def update
    @team.update!(name: update_params[:name])
  end

  def destroy
    @team.destroy!
  end

  private

  def team_params
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
    users_team = current_user.users_team.find_by!(team_id: params[:id])
    @team = Team.find(users_team.team_id)
  end
end
