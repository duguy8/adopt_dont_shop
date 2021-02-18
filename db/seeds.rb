# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter1 = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
shelter2 = Shelter.create!(name: 'Max Fund', address: '111 Cool St', city: 'Denver', state: 'CO', zip: '80223')
pet1 = shelter1.pets.create!(name: "Fluffy", approximate_age: 1, sex: 'male', description: 'Good lookin pup')
pet2 = shelter1.pets.create!(name: "Fluff", approximate_age: 2, sex: 'female', description: 'super cute')
pet3 = shelter1.pets.create!(name: "Doge", approximate_age: 3, sex: 'female', description: 'super cute')
pet4 = shelter2.pets.create!(name: "Apollo", approximate_age: 3, sex: 'female', description: 'super super cute')
pet5 = shelter2.pets.create!(name: "Eros", approximate_age: 2, sex: 'male', description: 'super cute')
pet6 = shelter2.pets.create!(name: "Zues", approximate_age: 1, sex: 'male', description: 'wow cute')
