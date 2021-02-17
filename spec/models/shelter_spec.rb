require 'rails_helper'

describe Shelter, type: :model do
  describe 'relationships' do
    it { should have_many :pets }
  end

  describe 'class methods' do
    it 'can return shelters by reverse alphabetical order' do
      shelter1 = create(:shelter, name: "A shelter")
      shelter2 = create(:shelter, name: "not a great shelter")
      shelter3 = create(:shelter, name: "hobby lobby")
      expected = [shelter2, shelter3, shelter1]
      expect(Shelter.reverse_by_name).to eq(expected)
    end

    it 'can find shelters with pending apps' do
      shelter1 = create(:shelter, name: "Max Fund", id: 1)
      shelter2 = create(:shelter, name: "A Fund", id: 2)
      app1 = create(:application, status: "Pending")
      eros = create(:pet, shelter_id: 1, status: false)
      apollo = create(:pet, shelter_id: 2, status: true)
      app1.pets << [apollo]
      expected = [shelter2]
      expect(Shelter.pending_apps).to eq(expected)
    end
  end

  describe "instance methods" do
    it 'can find average age of pets' do
      shelter1 = create(:shelter, name: "Max Fund", id: 1)
      eros = create(:pet, shelter_id: 1, approximate_age: 2)
      apollo = create(:pet, shelter_id: 1, approximate_age: 2)
      zues = create(:pet, shelter_id: 1, approximate_age: 8)
      expect(shelter1.average_age).to eq(4)
    end

    it 'can find adoptable pets' do
      shelter1 = create(:shelter, name: "Max Fund", id: 1)
      eros = create(:pet, shelter_id: 1, adoptable: true)
      apollo = create(:pet, shelter_id: 1, adoptable: false)
      expected = [eros]
      expect(shelter1.adoptable_pets).to eq(expected)
    end

    it "can find pets that have been adopted" do
      shelter1 = create(:shelter, name: "Max Fund", id: 1)
      eros = create(:pet, shelter_id: 1, adoptable: true)
      apollo = create(:pet, shelter_id: 1, adoptable: false)
      doge = create(:pet, shelter_id: 1, adoptable: false, status: true)
      expected = [doge]
      expect(shelter1.adopted).to eq(expected)
      expect(shelter1.adopted.count).to eq 1
    end

    it "can find all pets that have a pending application" do
      shelter1 = create(:shelter, name: "Max Fund", id: 1)
      eros = create(:pet, shelter_id: 1, adoptable: true, status: true)
      apollo = create(:pet, shelter_id: 1, adoptable: false)
      doge = create(:pet, shelter_id: 1, adoptable: false, status: true)
      expected = [eros]
      expect(shelter1.pending_pets).to eq(expected)
      expect(shelter1.pending_pets.count).to eq 1
    end
  end
end
