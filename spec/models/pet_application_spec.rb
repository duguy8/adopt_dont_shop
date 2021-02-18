require 'rails_helper'

describe PetApplication, type: :model do
  describe 'relationships' do
    it { should belong_to :pet }
    it { should belong_to :application }
  end

  describe "class methods" do
    it "can find specific applications and approve" do
      app1 = create(:application, id: 1)
      shelter = create(:shelter, id: 1)
      eros = create(:pet, shelter_id: 1)
      pet_app = PetApplication.create!(
        pet_id: eros.id,
        application_id: app1.id,
        approved: 0
      )
      expected = "approved"
      pass = {approve: eros.id, id: app1.id}
      expect(PetApplication.find_specific_and_approve(pass).first.approved).to eq(expected)
    end

    it "can find specific applications and reject" do
      app1 = create(:application, id: 1)
      shelter = create(:shelter, id: 1)
      eros = create(:pet, shelter_id: 1)
      pet_app = PetApplication.create!(
        pet_id: eros.id,
        application_id: app1.id,
        approved: 1
      )
      expected = "rejected"
      pass = {reject: eros.id, id: app1.id}
      expect(PetApplication.find_specific_and_reject(pass).first.approved).to eq(expected)
    end

    it "can find if there are apps that need reviewed" do
      app1 = create(:application, id: 1)
      shelter = create(:shelter, id: 1)
      eros = create(:pet, shelter_id: 1)
      pet_app = PetApplication.create!(
        pet_id: eros.id,
        application_id: app1.id,
        approved: 0
      )
      expect(PetApplication.need_reviewed?(eros.id)).to eq 1
    end
  end
end
