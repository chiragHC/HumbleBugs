# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    association :game
    description "MyText"
    status "new"
    reported_against nil
    fixed_in nil
  end
end