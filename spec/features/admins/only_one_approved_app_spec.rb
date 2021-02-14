require 'rails_helper'

RSpec.describe 'When a pet has an approved and pending app' do
  before :each do
    @app1 = create(:application)
    @app2 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
    @app1.pets << [@eros, @apollo]
    @app2.pets << [@eros, @doge]
  end

  describe "When I visit the pending app show page" do
    describe "No button to approve them, is button to reject" do
      it "Shows they are ~approved for adoption~" do
        visit "/admins/applications/#{@app1.id}"
        within("#approve-#{@apollo.id}") do
          click_button("Approve Application")
        end
        within("#approve-#{@eros.id}") do
          click_button("Approve Application")
        end
        within(".stats") do
          expect(page).to have_content("Approved")
        end
        visit "/admins/applications/#{@app2.id}"
        within("#approve-#{@eros.id}") do
          expect(page).not_to have_button("Approve Application")
          expect(page).to have_button("Reject Application")
        end
      end
    end
  end
end
