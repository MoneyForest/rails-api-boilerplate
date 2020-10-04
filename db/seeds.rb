company_name = Faker::Company.name

Project.create!(
  name: "#{company_name} Project No.1",
  description: "This is #{company_name} Project No.1",
  is_archived: 0,
  created_at: Time.zone.now,
  updated_at: Time.zone.now
)

100.times do |n|
  Task.create!(
    name: "#{company_name} Task No.#{n + 1}",
    description: "This is #{company_name} Task No.1",
    is_completed: 0,
    parent_task_id: rand(1..100),
    created_user_id: rand(1..100),
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

10.times do |n|
  Team.create!(
    name: "#{company_name} Team No.#{n + 1}",
    created_user_id: rand(1..100),
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

100.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

100.times do |n|
  TasksProject.create!(
    task_id: n + 1,
    project_id: 1,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

10.times do |n|
  TeamsProject.create!(
    team_id: n + 1,
    project_id: 1,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

100.times do |n|
  UsersProject.create!(
    user_id: n + 1,
    project_id: 1,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

100.times do |n|
  UsersTask.create!(
    user_id: n + 1,
    task_id: n % 10 + 1,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end

100.times do |n|
  UsersTeam.create!(
    user_id: n + 1,
    team_id: n % 10 + 1,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
  )
end
