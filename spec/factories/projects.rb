FactoryBot.define do
  factory :project do
    name {  "#{Faker::Company.name} Project" }
    description { "This is a project created by FactoryBot" }
    is_archived { false }
  end
end
