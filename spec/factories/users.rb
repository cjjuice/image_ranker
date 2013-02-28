# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "foobar"
    email "foo@my.uri.edu"
    password "secret"
    password_confirmation "secret"
  end
end
