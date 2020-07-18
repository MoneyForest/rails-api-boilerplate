FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Games::Pokemon.name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
  end
end
