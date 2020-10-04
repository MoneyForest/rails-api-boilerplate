FactoryBot.define do
  factory :project do
    name { "#{Faker::Company.name} Project" }
    description { 'This is a project created by FactoryBot' }
    is_archived { false }

    trait :with_a_task do
      after(:create) do |project|
        project.task << create(:task)
      end
    end

    trait :with_some_task do
      after(:create) do |project|
        rand(2..10).times do
          project.task << create(:task)
        end
      end
    end

    trait :with_a_team do
      after(:create) do |project|
        project.team << create(:team)
      end
    end

    trait :with_some_team do
      after(:create) do |project|
        rand(2..10).times do
          project.team << create(:team)
        end
      end
    end
  end
end
