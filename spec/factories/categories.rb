FactoryGirl.define do
  factory :category do
    association :tool
    name 'Chainsaws'
  end
end