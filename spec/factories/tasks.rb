FactoryBot.define do
  factory :task do
    name { "#{Faker::Alphanumeric.alpha(number: 1)} Task" }
    description { "All you have to do for this task is #{Faker::Alphanumeric.alpha(number: 200)}" }
    deadline_at { Time.zone.now }
    repeats { nil }
    is_completed { false }
    parent_task_id { 1 }
    assigned_user_id { 1 }
    created_user_id { 1 }

    trait :with_a_project do
      after(:create) do |task|
        task.project << create(:project)
      end
    end

    trait :with_some_project do
      after(:create) do |task|
        rand(2..10).times do
          task.project << create(:project)
        end
      end
    end
  end
end
