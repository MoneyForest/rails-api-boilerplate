class Project < ApplicationRecord
  has_many :teams_project, dependent: :destroy
  has_many :team, through: :teams_project
  has_many :users_project, dependent: :destroy
  has_many :project, through: :users_project
end
