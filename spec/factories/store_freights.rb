# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_freight, :class => 'Freight' do
    value 1.5
    service "MyString"
    order nil
    zipcode "MyString"
  end
end
