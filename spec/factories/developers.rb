# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :developer do
    sequence(:name) { |n| "Dev Name #{n}" }
    website "http://www.gamedeveloper.com/"
    time_zone "EST"
    address "123 Nowhere"
    contact_information "555-1234"
  end
end