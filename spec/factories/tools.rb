require 'faker'

FactoryGirl.define do
  factory :tool do
    association :location
    association :category
    sequence(:name) { |n|  "Chainsaw#{n}"}
    model 'Stihl 066'
    sequence(:serial) { |n| "000#{n}"}
  end
end