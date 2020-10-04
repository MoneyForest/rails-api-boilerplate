FactoryBot.define do
  factory :team do
    name { "#{Faker::Color.color_name} Team" }
    created_user_id { 1 }

    trait :with_a_project do
      after(:create) do |team|
        team.project << create(:project)
      end
    end

    trait :with_some_project do
      after(:create) do |team|
        rand(2..10).times do
          team.project << create(:project)
        end
      end
    end
  end
end
