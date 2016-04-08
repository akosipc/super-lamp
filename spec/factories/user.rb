FactoryGirl.define do
  factory :user do
    email "testy.macuserton@example.com"
    password   "password"
    password_confirmation "password"
    first_name "Testy"
    last_name "Userton"
  end

end
