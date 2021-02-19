require 'rails_helper'

RSpec.describe 'When I visit an admin application show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1, name: "Eros")
    @doge = create(:pet, shelter_id: 1)
  end

  describe "There is a button to approve app for each pet" do
    it 'Has button that takes me back to admin app show page' do
      visit "/applications/#{@app1.id}"
      fill_in "search", :with => "eros"
      click_button("Search Pets")
      click_button("Adopt this Pet")

      visit "/admins/applications/#{@app1.id}"
      within("#admin-pet-#{@eros.id}") do
        expect(page).to have_button("Approve Application")
      end
      click_button("Approve Application")
      expect(current_path).to eq("/admins/applications/#{@app1.id}")
      within("#admin-pet-#{@eros.id}") do
        expect(page).not_to have_button("Approve Application")
        expect(page).to have_content("Application Approved")
      end
    end
  end
end
