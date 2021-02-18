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

  describe 'instance methods' do
    it "can find a pet application" do
      app1 = create(:application, id: 1)
      shelter = create(:shelter, id: 1)
      eros = create(:pet, shelter_id: 1, adoptable: false, status: true)
      pet_app = PetApplication.create!(
        pet_id: eros.id,
        application_id: app1.id
      )
      expected = [app1.find_petapp(eros.id)]
      expect(app1.find_petapp(eros.id)).to eq([pet_app])
    end
  end
end
