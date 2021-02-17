FactoryBot.define do
  factory :application do
    name { Faker::Name.name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip_code }
    description { Faker::ChuckNorris.fact }
    status { "In Progress" } 
  end
end
