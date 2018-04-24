FactoryBot.define do
  factory :friendship do
  	friend1 { Faker::Name.first_name + "@example.com" }
  	friend2 { Faker::Name.first_name + "@example.com" }
  end
end