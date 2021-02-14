require 'rails_helper'

RSpec.describe 'When I visit an admin application show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
    @app1.pets << [@eros, @apollo]
  end

  describe "There is a button to approve app for each pet" do
    it 'Has button that takes me back to admin app show page' do
      visit "/admin/applications/#{@app1.id}"
      within("#admin-pet-#{@eros.id}") do
        expect(page).to have_button("Approve Application")
      end
    end
  end
end
