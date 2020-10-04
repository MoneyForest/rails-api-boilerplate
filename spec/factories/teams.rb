FactoryBot.define do
  factory :team do
    name { "#{Faker::Color.color_name} Team" }
    created_user_id { 1 }
  end
end
