require 'rails_helper'

RSpec.describe 'As a vistor visiting the Applications show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
    PetApplication.create!(pet: @apollo, application: @app1)
    PetApplication.create!(pet: @eros, application: @app1)
  end

  it 'Shows Application attributes' do
    visit "/applications/#{@app1.id}"
      expect(page).to have_content(@app1.name)
      expect(page).to have_content(@app1.street_address)
      expect(page).to have_content(@app1.city)
      expect(page).to have_content(@app1.state)
      expect(page).to have_content(@app1.zipcode)
      expect(page).to have_content(@app1.status)
      expect(page).to have_content(@app1.description)

    within("#pet_section") do
      expect(page).to have_link(@apollo.name)
      expect(page).to have_link(@eros.name)
    end

    click_link(@apollo.name)
    expect(current_path).to eq("/pets/#{@apollo.id}")
  end

  describe 'When I visit the new application page' do
    describe 'And when I fail to fill in any fields and submit' do
      it 'takes me back to the new app page and says must fill in required fields' do
        visit "/pets"
        click_link("Start an Application")
        fill_in "name", :with => "Cait B"
        fill_in "street_address", :with => "111 Sweet St"
        fill_in "city", :with => "Tampa"
        click_button("Submit")
        expect(current_path).to eq("/applications")
        expect(page).to have_content("Required fields missing")
      end

      it 'takes me back when name is not filled in' do
        visit "/pets"
        click_link("Start an Application")
        fill_in "street_address", :with => "111 Sweet St"
        fill_in "city", :with => "Tampa"
        fill_in "state", :with => "FL"
        fill_in "zipcode", :with => "33331"
        click_button("Submit")
        expect(current_path).to eq("/applications")
        expect(page).to have_content("Required fields missing")
      end
    end
  end
end
