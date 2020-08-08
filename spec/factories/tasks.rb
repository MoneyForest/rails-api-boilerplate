FactoryBot.define do
  factory :task do
    name { 'MyString' }
    description { 'MyText' }
    deadline { '2020-07-24 23:58:53' }
    repeats { 'MyString' }
    completed { false }
    parent_id { false }
    assignee_id { 1 }
    creator_id { 1 }
  end
end
