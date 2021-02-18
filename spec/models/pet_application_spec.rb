require 'rails_helper'

describe PetApplication, type: :model do
  describe 'relationships' do
    it { should belong_to :pet }
    it { should belong_to :application }
  end

  describe "class methods" do
    it "can be approved" do
      app1 = create(:application, id: 1)
      shelter = create(:shelter, id: 1)
      eros = create(:pet, shelter_id: 1, adoptable: false, status: true)
      pet_app = PetApplication.create!(
        pet_id: eros.id,
        application_id: app1.id,
        approved: 0
      )
      expected = eros.pet_applications.approve
      expect(pet_app.approved).to eq("pending")
      expect(expected.first.approved).to eq("approved")
    end

    it "can see if all pet apps are approved" do
      app1 = create(:application, id: 1)
      app2 = create(:application, id: 2)
      shelter = create(:shelter, id: 1)
      eros = create(:pet, shelter_id: 1, adoptable: false, status: true)
      pet_app = PetApplication.create!(
        pet_id: eros.id,
        application_id: app1.id,
        approved: 2
      )
      pet_app2 = PetApplication.create!(
        pet_id: eros.id,
        application_id: app2.id,
        approved: 2
      )
      expected = eros.pet_applications.all_approved?
      expect(expected.length).to eq(0)
    end
  end
end
