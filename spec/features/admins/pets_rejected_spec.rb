require 'rails_helper'

RSpec.describe 'When I visit an admin app show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1)
    @apollo = create(:pet, shelter_id: 1, name: "Apollo")
    # @app1.pets << [@eros]
  end

  describe "When some pets are approved but one rejected" do
    describe "Im taken back to the admin app show page" do
      it "Shows the applications status is now ~Rejected~" do
        visit "/applications/#{@app1.id}"
        fill_in "search", :with => "apollo"
        click_button("Search Pets")
        click_button("Adopt this Pet")
        fill_in "description", :with => "I love doggos"
        click_button("Submit Application")

        expected = "Rejected"
        visit "/admins/applications/#{@app1.id}"
        click_button("Reject Application")
        within("#admin-pet-#{@apollo.id}") do
          expect(page).not_to have_button("Approve Application")
          expect(page).not_to have_button("Reject Application")
        end
        expect(page).to have_content("Application Rejected")
      end
    end
  end
end
