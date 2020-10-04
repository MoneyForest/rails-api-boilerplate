FactoryBot.define do
  factory :project do
    name { 'MyString' }
    description { 'MyText' }
    team_id { 1 }
    is_archived { false }
  end
end
