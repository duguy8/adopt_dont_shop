FactoryBot.define do
  factory :pet do
    name { Faker::Name.name }
    approximate_age { Faker::Number.between(from: 1, to: 10) }
    description { Faker::ChuckNorris.fact }
    adoptable { true }
    sex { 'female' }
    shelter
  end
end
