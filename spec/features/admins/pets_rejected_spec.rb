require 'rails_helper'

RSpec.describe 'When I visit an admin app show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @app1.pets << [@eros]
  end

  describe "When some pets are approved but one rejected" do
    describe "Im taken back to the admin app show page" do
      it "Shows the applications status is now ~Rejected~" do
        expected = "Rejected"
        visit "/admins/applications/#{@app1.id}"
        click_button("Reject Application")
        within("#admin-pet-#{@eros.id}") do
          expect(page).not_to have_button("Approve Application")
          expect(page).not_to have_button("Reject Application")
        end
        expect(page).to have_content("Application Rejected")
      end
    end
  end
end
