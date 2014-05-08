# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_product, :class => MechanizeStore::Product do
    name "MyString"
    description "MyText"
    short_description "MyString"
    price 1.5
    weight 1.5
    length 1.5
    height 1.5
    width 1.5
    product_category nil
  end
end
