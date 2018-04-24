FactoryBot.define do
  factory :following do
    source { Faker::Name.first_name + "@example.com" }
    audience { Faker::Name.first_name + "@example.com" }
  end
end