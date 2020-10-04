FactoryBot.define do
  factory :teams_project do
    team_id { team.id }
    project_id { project.id }
  end
end
