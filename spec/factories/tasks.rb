FactoryBot.define do
  factory :task do
    name { 'MyString' }
    description { 'MyText' }
    deadline_at { '2020-07-24 23:58:53' }
    repeats { 'MyString' }
    is_completed { false }
    parent_task_id { false }
    assigned_user_id { 1 }
    created_user_id { 1 }
  end
end
