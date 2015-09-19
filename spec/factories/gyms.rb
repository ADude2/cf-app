FactoryGirl.define do
  factory :gym do
    name "Ballston Crossfit"
    website "http://www.ballstoncrossfit.com"
    address "1110 North Glebe Rd"
    city "Arlington"
    state "VA"
    zip "22201"
    country "United States"
    lat 38.8838
    long -77.1172
    unique_id 6
  end
end
