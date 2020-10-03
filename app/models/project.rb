class Project < ApplicationRecord
  has_many :teams_project
  has_many :team, through: :teams_project
end
