require 'rails_helper'

RSpec.describe 'When I visit an admin shelter show page' do
  before :each do
    @app_a = create(:application, status: 3 )
    @app_b = create(:application, status: 1 )
    @app_c = create(:application, status: 0 )
    @shelter1 = create(:shelter, name: "Tampa Shelter", id: 1)
    @eros = create(:pet, approximate_age: 1, adoptable: true, shelter_id: 1)
    @apollo = create(:pet, approximate_age: 3, adoptable: false, status: true, shelter_id: 1)
    @new_pup = create(:pet, approximate_age: 4, adoptable: true, shelter_id: 1)
    @doge = create(:pet, approximate_age: 2, adoptable: false, shelter_id: 1)
    @app_a.pets << [@apollo]
    @app_b.pets << [@eros, @new_pup]
    @app_c.pets << [@doge, @new_pup]
  end

  describe "I see a section for statistics" do
    it "Shows the number of adoptable pets for that shelter" do
      visit "/admin/shelters/#{@shelter1.id}"
      within("#statistics") do
        expect(page).to have_content("Number of adoptable pets: 2")
      end
    end

    it "Shows number of pets that have been adopted from that shelter" do
      visit "/admin/shelters/#{@shelter1.id}"
      within("#statistics") do
        expect(page).to have_content("Number of pets that have been adopted: 1")
      end
    end
  end
end
