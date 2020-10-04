FactoryBot.define do
  factory :users_team do
    user_id { user.id }
    team_id { team.id }
  end
end
