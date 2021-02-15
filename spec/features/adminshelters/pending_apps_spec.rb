require 'rails_helper'

RSpec.describe 'When I visit "/admin/shelters"' do
  before :each do
    @shelter1 = create(:shelter, name: "Tampa Shelter", id: 1)
    @shelter2 = create(:shelter, name: "Max Fund", id: 2)
    @app1 = create(:application)
    @app2 = create(:application)
    @eros = create(:pet, shelter_id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
    @app1.pets << [@eros, @apollo]
    @app2.pets << [@eros, @doge]
  end

  describe "I see a section for 'Shelter's with Pending Applications'" do
    it "Shows every shelter with a pending application" do
      visit "/applications/#{@app1.id}"
      fill_in "description", :with => "Love pets"
      click_button "Submit Application"
      visit "/applications/#{@app2.id}"
      fill_in "description", :with => "I also love pets"
      click_button "Submit Application"
      visit "/admin/shelters"
      save_and_open_page
      within("#pending") do
        expect(page).to have_content(@shelter1.name)
        expect(page).to have_content(@shelter2.name)
      end
    end
  end
end
