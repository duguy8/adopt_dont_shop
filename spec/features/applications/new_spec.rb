require 'rails_helper'

RSpec.describe 'As a vistor visiting the Pet index page' do
  before :each do
    @app1 = Application.create!(name: "Guy", street_address: "111", city: "Tampa", state: "FL", zipcode: "11111")
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
    PetApplication.create!(pet: @apollo, application: @app1)
    PetApplication.create!(pet: @eros, application: @app1)
  end

  describe 'See a link to start an application' do
    it 'Has a link that takes me to new application page' do
      visit "/pets"
      expect(page).to have_link("Start an Application")
      click_link("Start an Application")
      expect(page).to have_button("Submit")
      fill_in "name", :with => "Cait B"
      fill_in "street_address", :with => "111 Sweet St"
      fill_in "city", :with => "Tampa"
      fill_in "state", :with => "FL"
      fill_in "zipcode", :with => "32123"
      click_button("Submit")
      expect(page).to have_content("Cait B")
      expect(page).to have_content("111 Sweet St")
      expect(page).to have_content("Tampa")
      expect(page).to have_content("FL")
      expect(page).to have_content("32123")
      expect(page).to have_content("In Progress")
    end

    it "Can't be made without a name" do
      visit "/pets"
      expect(page).to have_link("Start an Application")
      click_link("Start an Application")
      expect(page).to have_button("Submit")
      fill_in "street_address", :with => "111 Sweet St"
      fill_in "city", :with => "Tampa"
      fill_in "state", :with => "FL"
      fill_in "zipcode", :with => "32123"
      click_button("Submit")
      expect(page).to have_content("Required fields missing")
    end

    it 'Works with callbacks' do
      visit "/pets"
      expect(page).to have_link("Start an Application")
      click_link("Start an Application")
      expect(page).to have_button("Submit")
      fill_in "name", :with => "cait"
      fill_in "street_address", :with => "111 Sweet St"
      fill_in "city", :with => "tampa"
      fill_in "state", :with => "fl"
      fill_in "zipcode", :with => "32123"
      click_button("Submit")
      expect(page).to have_content("Cait")
      expect(page).to have_content("111 Sweet St")
      expect(page).to have_content("Tampa")
      expect(page).to have_content("FL")
      expect(page).to have_content("32123")
      expect(page).to have_content("In Progress")
    end
  end
end
