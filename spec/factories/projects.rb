FactoryBot.define do
  factory :project do
    name { 'MyString' }
    description { 'MyText' }
    team_id { 1 }
    archived { false }
  end
end
