# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_store, :class => 'Store' do
    name "MyString"
    key "MyString"
    url "MyString"
    zipcode "MyString"
  end
end
