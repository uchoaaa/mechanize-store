# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mechanize_store_flag, :class => 'Flag' do
    name "MyString"
  end
end
