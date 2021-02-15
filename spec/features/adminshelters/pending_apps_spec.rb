require 'rails_helper'

RSpec.describe 'When I visit "/admin/shelters"' do
  before :each do
    @shelter1 = create(:shelter, name: "Tampa Shelter", id: 1)
    @shelter2 = create(:shelter, name: "Max Fund", id: 2)
    @shelter3 = create(:shelter, name: "A Fund", id: 3)
    @app1 = create(:application)
    @app2 = create(:application)
    @app3 = create(:application)
    @eros = create(:pet, shelter_id: 1)
    @apollo = create(:pet, shelter_id: 2)
    @new_pup = create(:pet, shelter_id: 3)
    @doge = create(:pet, shelter_id: 1)
    @app1.pets << [@eros, @apollo]
    @app2.pets << [@eros, @doge,]
    @app3.pets << [@new_pup]
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
      within("#pending") do
        expect(page).to have_content(@shelter1.name)
        expect(page).to have_content(@shelter2.name)
      end
    end

    it 'Shows the shelters in alphabetical order' do
      visit "/applications/#{@app1.id}"
      fill_in "description", :with => "Love pets"
      click_button "Submit Application"
      visit "/applications/#{@app2.id}"
      fill_in "description", :with => "I also love pets"
      click_button "Submit Application"
      visit "/applications/#{@app3.id}"
      fill_in "description", :with => "I also love pets"
      click_button "Submit Application"
      visit "/admin/shelters"
      within("#pending") do
        expect(@shelter3.name).to appear_before(@shelter2.name)
        expect(@shelter3.name).to appear_before(@shelter1.name)
        expect(@shelter2.name).to appear_before(@shelter1.name)
      end
    end
  end
end
