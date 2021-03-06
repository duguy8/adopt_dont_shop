require 'rails_helper'

RSpec.describe 'When I visit an admin application show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1, name: "Cute Dog")
    @doge = create(:pet, shelter_id: 1)
  end

  describe "Next to every pet the application is for" do
    it "Has a button to reject for specific pet" do
      visit "/applications/#{@app1.id}"
      fill_in "search", :with => "Cute Dog"
      click_button("Search Pets")
      click_button("Adopt this Pet")
      fill_in "description", :with => "I love doggos"
      click_button("Submit Application")

      visit "/admins/applications/#{@app1.id}"
      within("#admin-pet-#{@eros.id}") do
        expect(page).to have_button("Reject Application")
      end
      click_button("Reject Application")
      expect(current_path).to eq("/admins/applications/#{@app1.id}")
      within("#admin-pet-#{@eros.id}") do
        expect(page).not_to have_button("Approve Application")
        expect(page).not_to have_button("Reject Application")
        expect(page).to have_content("Application Rejected")
      end
    end
  end
end
