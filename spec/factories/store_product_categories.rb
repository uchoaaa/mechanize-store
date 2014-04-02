# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_product_category, :class => 'ProductCategory' do
    name "MyString"
    product_category nil
  end
end
