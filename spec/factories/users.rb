FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { 'password' }
    password_confirmation { 'password' }

    trait :with_a_project do
      after(:create) do |user|
        user.project << create(:project)
      end
    end

    trait :with_some_project do
      after(:create) do |user|
        rand(2..10).times do
          user.project << create(:project)
        end
      end
    end

    trait :with_a_task do
      after(:create) do |user|
        user.task << create(:task)
      end
    end

    trait :with_some_task do
      after(:create) do |user|
        rand(2..10).times do
          user.task << create(:task)
        end
      end
    end

    trait :with_a_team do
      after(:create) do |user|
        user.team << create(:team)
      end
    end

    trait :with_some_team do
      after(:create) do |user|
        rand(2..10).times do
          user.team << create(:team)
        end
      end
    end

    trait :with_a_project_and_team_and_task do
      after(:create) do |user|
        project = create(:project)
        team = create(:team, user: user)
        task = create(:task, user: user)

        user.project << project
        user.team << team
        user.task << task

        create(:tasks_project, task: task, project: project)
        create(:teams_project, team: team, project: project)
      end
    end
  end
end
