company_name = Faker::Company.name

10.times do |n|
  Project.create!(
      id: n,
      name: "#{company_name} Project No.#{n + 1}",
      description: "This is #{company_name} Project No.#{n + 1}",
      team_id: 0,
      archived: n % 7 == 0 ? 1 : 0,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
  )
end

10.times do |n|
  User.create!(
      id: n,
      name: "#{company_name} Project No.#{n + 1}",
      description: "This is #{company_name} Project No.#{n + 1}",
      team_id: 0,
      archived: n % 7 == 0 ? 1 : 0,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
  )
end

100.times do |n|
  Task.create!(
      id: n,
      name: "#{company_name} Task No.#{n + 1}",
      description: "This is #{company_name} Task No.#{n + 1}",
      deadline: Time.zone.now,
      repeats: nil,
      completed: 0,
      parent_id: nil,
      assignee_id: nil,
      creator_id: nil,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
  )
end

100.times do |n|
  Team.create!(
      id: n,
      name: "#{company_name} Project No.#{n + 1}",
      description: "This is #{company_name} Project No.#{n + 1}",
      creator_id: nil,
      created_at: Time.zone.now,
      updated_at: Time.zone.now
  )
end
