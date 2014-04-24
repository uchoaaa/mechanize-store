# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_freight, :class => MechanizeStore::Freight do
    value 1.5
    service "MyString"
    zipcode "MyString"
  end
end
