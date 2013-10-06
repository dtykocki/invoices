FactoryGirl.define do
  factory :user do
    email "test@example.com"
    first_name "Test"
    last_name "Tester"
    password "fake_password"
    password_confirmation "fake_password"
  end
end
