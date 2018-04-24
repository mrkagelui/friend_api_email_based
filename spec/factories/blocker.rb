FactoryBot.define do
  factory :blockade do
    blocker { Faker::Name.first_name + "@example.com" }
    blockee { Faker::Name.first_name + "@example.com" }
  end
end