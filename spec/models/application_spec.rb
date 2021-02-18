require 'rails_helper'

describe Application, type: :model do
  describe 'relationships' do
    it { should have_many :pet_applications }
    it { should have_many(:pets).through(:pet_applications) }
  end

describe 'validations' do
  it {should validate_presence_of :name}
  it {should validate_presence_of :street_address}
  it {should validate_presence_of :city}
  it {should validate_presence_of :state}
  it {should validate_presence_of :zipcode}
  end

  describe "instance methods" do
    it "can show rejected status" do
      app1 = create(:application)
      app2 = create(:application)
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(sex: :female, name: "Fluffy", approximate_age: 3, description: 'super cute')
      pet2 = shelter.pets.create!(sex: :female, name: "Doge", approximate_age: 3, description: 'super cute')
      PetApplication.create(
        application_id: app1.id,
        pet_id: pet.id,
        approved: 1
      )
      PetApplication.create(
        application_id: app1.id,
        pet_id: pet2.id,
        approved: 1
      )
      expect(app1.status_check).to eq("Rejected")
    end

    it "can show approved status" do
      app1 = create(:application)
      app2 = create(:application)
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(sex: :female, name: "Fluffy", approximate_age: 3, description: 'super cute')
      pet2 = shelter.pets.create!(sex: :female, name: "Doge", approximate_age: 3, description: 'super cute')
      PetApplication.create(
        application_id: app1.id,
        pet_id: pet.id,
        approved: 2
      )
      PetApplication.create(
        application_id: app1.id,
        pet_id: pet2.id,
        approved: 2
      )
      expect(app1.status_check).to eq("Approved")
    end

    it "can show pending status" do
      app1 = create(:application)
      app2 = create(:application)
      shelter = Shelter.create!(name: 'Pet Rescue', address: '123 Adoption Ln.', city: 'Denver', state: 'CO', zip: '80222')
      pet = shelter.pets.create!(sex: :female, name: "Fluffy", approximate_age: 3, description: 'super cute')
      pet2 = shelter.pets.create!(sex: :female, name: "Doge", approximate_age: 3, description: 'super cute')
      PetApplication.create(
        application_id: app1.id,
        pet_id: pet.id,
        approved: 0
      )
      PetApplication.create(
        application_id: app1.id,
        pet_id: pet2.id,
        approved: 0
      )
      expect(app1.status_check).to eq("Pending")
    end
  end
end
