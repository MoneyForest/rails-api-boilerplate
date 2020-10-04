FactoryBot.define do
  factory :users_task do
    user_id { user.id }
    task_id { task.id }
  end
end
