require 'faker'

FactoryGirl.define do
  factory :location do
    name {Faker::Company.name}
    vehicle {rand(4).even? ? true : false}
    type {rand(4).even? ? 'Vehicle' : 'Station'}

  end
end