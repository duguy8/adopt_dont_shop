require 'rails_helper'

RSpec.describe 'When there are two apps for one pet' do
  before :each do
    @app1 = create(:application)
    @app2 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1, name: "Cute Dog")
    @apollo = create(:pet, shelter_id: 1, name: "Pup")
  end

  describe "When I approve a pet on first apps show page" do
    describe "And visit other apps admin show page" do
      it "Shows the pet and can be approved/rejected" do
        visit "/applications/#{@app1.id}"
        fill_in "search", :with => "Cute Dog"
        click_button("Search Pets")
        click_button("Adopt this Pet")

        fill_in "description", :with => "I love doggos"
        click_button("Submit Application")

        visit "/admins/applications/#{@app1.id}"
        within("#approve-#{@eros.id}") do
          expect(page).to have_button("Approve Application")
          click_button("Approve Application")
        end

        visit "/applications/#{@app2.id}"
        fill_in "search", :with => "pup"
        click_button("Search Pets")
        click_button("Adopt this Pet")

        fill_in "description", :with => "I love pupz"
        click_button("Submit Application")

        visit "/admins/applications/#{@app2.id}"
        within("#admin-pet-#{@apollo.id}") do
          expect(page).to have_button("Approve Application")
          expect(page).to have_button("Reject Application")
          expect(page).to have_content(@apollo.name)
        end
      end
    end
  end
end
