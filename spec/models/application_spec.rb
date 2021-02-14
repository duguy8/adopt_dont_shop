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
    it "can be approved" do
      @app1 = create(:application)
      @app2 = create(:application)
      @shelter = create(:shelter, id: 1)
      @eros = create(:pet, shelter_id: 1, adoptable: false, status: true)
      @app1.pets << [@eros]
      expected = "Approved"
      expect(@app1.approved?.status).to eq(expected)
    end
  end
end
