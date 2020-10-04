FactoryBot.define do
  factory :users_project do
    user_id { user.id }
    project_id { project.id }
  end
end
