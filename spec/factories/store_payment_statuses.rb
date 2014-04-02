# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_payment_status, :class => 'PaymentStatus' do
    name "MyString"
  end
end
