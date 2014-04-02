# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_payment_type, :class => 'PaymentType' do
    name "MyString"
  end
end
