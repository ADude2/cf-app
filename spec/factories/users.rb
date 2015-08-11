FactoryGirl.define do
  factory :user do
    email "lolleroni@example.com"
    user_name "Lolleroni"
    password "helloworld"
    id 1
    confirmed_at Time.now
  end
end