# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_order, :class => MechanizeStore::Order do
    order_status nil
    mechanize_store nil
    delivery_date "2014-04-02 12:31:39"
  end
end
