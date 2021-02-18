require 'rails_helper'

RSpec.describe 'When a pet has an approved and pending app' do
  before :each do
    @app1 = create(:application)
    @app2 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1, name: "Doge")
  end

  describe "When I visit the pending app show page" do
    describe "No button to approve them, is button to reject" do
      it "Shows they are ~approved for adoption~" do
        visit "/applications/#{@app1.id}"
        fill_in "search", :with => "doge"
        click_button("Search Pets")
        click_button("Adopt this Pet")

        fill_in "description", :with => "I love doggos"
        click_button("Submit Application")

        visit "/applications/#{@app2.id}"
        fill_in "search", :with => "doge"
        click_button("Search Pets")
        click_button("Adopt this Pet")

        fill_in "description", :with => "I love pupz"
        click_button("Submit Application")

        visit "/admins/applications/#{@app1.id}"
        within("#approve-#{@doge.id}") do
          click_button("Approve Application")
        end
        within(".stats") do
          expect(page).to have_content("Approved")
        end
      end
    end
  end
end
