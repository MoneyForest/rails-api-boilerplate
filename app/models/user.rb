# frozen_string_literal: true

class User < ApplicationRecord
  has_many :users_project
  has_many :project, through: :users_project
  has_many :users_task
  has_many :task, through: :users_task
  has_many :users_team
  has_many :team, through: :users_team

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
