# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_order, :class => Store::Order do
    order_status nil
    store nil
    delivery_date "2014-04-02 12:31:39"
  end
end
