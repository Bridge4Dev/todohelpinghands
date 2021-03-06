FactoryGirl.define do
  factory :user do
    first_name "first"
    last_name "last"
    sequence(:email) { |n| "user#{n}@website.com" }
    password "password"
    password_confirmation "password"
  end
end