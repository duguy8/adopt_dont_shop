require 'rails_helper'

RSpec.describe 'When I visit an admin app show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @app1.pets << [@eros, @apollo]
  end

  describe "When all pets are approved" do
    describe "And I visit the pets show pages" do
      it "Shows they are no longer ~adoptable~" do
        visit "/admins/applications/#{@app1.id}"
        # click_button "Approve Application", href: "/admins/applications/#{@app1.id}"
        # click_button("Approve Application", exact: true)
        within("#approve-#{@eros.id}") do
          expect(page).to have_button("Approve Application")
          click_button("Approve Application")
        end
        visit "/pets/#{@eros.id}"
        expect(page).to have_content("Unavailable")
        visit "/pets/#{@apollo.id}"
        expect(page).to have_content("Available")
        visit "/admins/applications/#{@app1.id}"
        within("#approve-#{@apollo.id}") do
          expect(page).to have_button("Approve Application")
          click_button("Approve Application")
        end
        visit "/pets/#{@apollo.id}"
        expect(page).to have_content("Unavailable")
      end
    end
  end
end
