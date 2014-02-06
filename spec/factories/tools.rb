require 'faker'

FactoryGirl.define do
  factory :tool do
    association :location
    association :category
    sequence(:id) { |n| n }
    name {Faker::Name.first_name}
    model {Faker::Company.name}
    serial {Faker::Address.latitude}
  end
end