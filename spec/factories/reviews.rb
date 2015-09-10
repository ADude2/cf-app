FactoryGirl.define do
  factory :review do
    user
    gym
    content "Great review!"
    coaching 4.0
    pricing 4.0
    equipment 4.0
    location 4.0
    score 4.0
  end

end
