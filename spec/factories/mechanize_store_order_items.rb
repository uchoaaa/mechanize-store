# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_order_item, :class => 'OrderItem' do
    quantity 1
    price 1.5
    order nil
    product nil
  end
end
