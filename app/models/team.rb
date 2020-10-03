class Team < ApplicationRecord
  has_many :teams_project, dependent: :destroy
  has_many :project, through: :teams_project
  has_many :users_team, dependent: :destroy
  has_many :user, through: :users_team
end
