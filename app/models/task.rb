class Task < ApplicationRecord
  has_many :tasks_project, dependent: :destroy
  has_many :project, through: :tasks_project
  has_many :users_task, dependent: :destroy
  has_many :user, through: :users_task
end
