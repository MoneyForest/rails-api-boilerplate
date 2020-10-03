class Project < ApplicationRecord
  has_many :teams_project, dependent: :destroy
  has_many :team, through: :teams_project
end
