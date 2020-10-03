class Team < ApplicationRecord
  has_many :teams_project
  has_many :project, through: :teams_project
  has_many :users_team
  has_many :user, through: :users_team
end
