require 'rails_helper'

RSpec.describe 'When I visit an admin app show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1, name: "Eros")
    @apollo = create(:pet, shelter_id: 1, name: "Apollo")
  end

  describe "When all pets are approved" do
    describe "And I visit the pets show pages" do
      # it "Shows they are no longer ~adoptable~" do
      #   visit "/applications/#{@app1.id}"
      #   fill_in "search", :with => "eros"
      #   click_button("Search Pets")
      #   click_button("Adopt this Pet")
      #
      #   fill_in "description", :with => "I love doggos"
      #   click_button("Submit Application")
      #
      #   visit "/admins/applications/#{@app1.id}"
      #   within("#approve-#{@eros.id}") do
      #     expect(page).to have_button("Approve Application")
      #     click_button("Approve Application")
      #   end
      #
      #   visit "/applications/#{@app1.id}"
      #   fill_in "search", :with => "apollo"
      #   click_button("Search Pets")
      #   click_button("Adopt this Pet")
      #
      #   fill_in "description", :with => "I love doggos"
      #   click_button("Submit Application")
      #
      #   visit "/admins/applications/#{@app1.id}"
      #   within("#approve-#{@apollo.id}") do
      #     expect(page).to have_button("Approve Application")
      #     click_button("Approve Application")
      #   end
      #
      #   visit "/pets/#{@eros.id}"
      #   expect(page).to have_content("Unavailable")
      #   visit "/pets/#{@apollo.id}"
      #   expect(page).to have_content("Unavailable")
      # end
    end
  end
end
