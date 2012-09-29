# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "foo@bar.com"
    password "secret"
    password_confirmation "secret"
  end
end
