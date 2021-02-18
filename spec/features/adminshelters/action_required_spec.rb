require 'rails_helper'

RSpec.describe 'When I visit an admin shelter show page' do
  before :each do
    @app1 = create(:application)
    @shelter1 = create(:shelter, name: "Tampa Shelter", id: 1)
    @eros = create(:pet, approximate_age: 1, shelter_id: 1, name: "Cute Dog")
  end

  describe "I see a section titled ~Action Required~" do
    describe "I see a list of all pets that have a pending application and" do
      it "Has not been marked ~approved or rejected~" do
        visit "/applications/#{@app1.id}"
        fill_in "search", :with => "Cute Dog"
        click_button("Search Pets")
        click_button("Adopt this Pet")
        fill_in "description", :with => "I love doggos"
        click_button("Submit Application")
        visit "/admin/shelters/#{@shelter1.id}"
        within("#action-required") do
          expect(page).to have_content(@eros.name)
        end
      end
    end

    describe "Next to each pets name there is a link" do
      it "Takes you to admin app show page where you can accept or reject pet" do
        visit "/applications/#{@app1.id}"
        fill_in "search", :with => "Cute Dog"
        click_button("Search Pets")
        click_button("Adopt this Pet")
        fill_in "description", :with => "I love doggos"
        click_button("Submit Application")
        visit "/admin/shelters/#{@shelter1.id}"
        within("#action-required") do
          expect(page).to have_content(@eros.name)
          expect(page).to have_link("Review Pet")
          click_link("Review Pet")
        end
        within("#admin-pet-#{@eros.id}") do
          expect(page).to have_button("Approve Application")
          expect(page).to have_button("Reject Application")
        end
      end
    end
  end
end
