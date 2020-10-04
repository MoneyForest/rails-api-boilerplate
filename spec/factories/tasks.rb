FactoryBot.define do
  factory :task do
    name { "#{Faker::Alphanumeric.alpha(number: 10)}" }
    description { "#{Faker::Alphanumeric.alpha(number: 200)}" }
    deadline_at { Time.zone.now }
    repeats { nil }
    is_completed { false }
    parent_task_id { false }
    assigned_user_id { 1 }
    created_user_id { 1 }
  end
end
