FactoryGirl.define do
  factory :tool do
    association :location
    association :category
    name 'Chainsaw'
    model 'Stihl 066'
    sequence(:serial) { |n| "000#{n}"}
    location_id '1'
    category_id '2'
  end
end