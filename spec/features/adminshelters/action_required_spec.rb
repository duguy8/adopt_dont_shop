require 'rails_helper'

RSpec.describe 'When I visit an admin shelter show page' do
  before :each do
    @app_a = create(:application, status: "Approved")
    @app_b = create(:application, status: "Pending")
    @app_c = create(:application, status: "In Progress")
    @shelter1 = create(:shelter, name: "Tampa Shelter", id: 1)
    @eros = create(:pet, approximate_age: 1, adoptable: true, shelter_id: 1)
    @apollo = create(:pet, approximate_age: 3, adoptable: false, status: true, shelter_id: 1)
    @new_pup = create(:pet, approximate_age: 4, adoptable: true, shelter_id: 1)
    @doge = create(:pet, approximate_age: 2, adoptable: false, shelter_id: 1)
    @app_a.pets << [@apollo]
    @app_b.pets << [@eros, @new_pup]
    @app_c.pets << [@doge, @new_pup]
  end

  describe "I see a section titled ~Action Required~" do
    describe "I see a list of all pets that have a pending application and" do
      it "Has not been marked ~approved or rejected~" do
      end
    end
  end
end
