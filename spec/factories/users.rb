# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "foobar"
    email "foo@bar.com"
    password "secret"
    password_confirmation "secret"
  end
end
