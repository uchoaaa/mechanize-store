# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_product_photo, :class => 'ProductPhoto' do
    file ""
    product nil
  end
end
