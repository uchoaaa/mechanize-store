# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_order_status, :class => 'OrderStatus' do
    name "MyString"
  end
end
