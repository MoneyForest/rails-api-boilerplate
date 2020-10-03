class Task < ApplicationRecord
  has_many :tasks_project
  has_many :task, through: :tasks_project
  has_many :users_task
  has_many :user, through: :users_task
end
