require 'rails_helper'

RSpec.describe 'When I visit an admin shelter show page' do
  before :each do
    @app_a = create(:application, status: 3 )
    @app_b = create(:application, status: 1 )
    @app1 = create(:application, status: 0 )
    @shelter1 = create(:shelter, name: "Tampa Shelter", id: 1)
    @eros = create(:pet, approximate_age: 1, name: "Cute Dog", adoptable: true, shelter_id: 1, status: true)
    @apollo = create(:pet, approximate_age: 3, adoptable: false, status: true, shelter_id: 1)
    @new_pup = create(:pet, approximate_age: 4, adoptable: true, shelter_id: 1)
    @doge = create(:pet, approximate_age: 2, adoptable: false, shelter_id: 1)
    @app_a.pets << [@apollo]
    @app_b.pets << [@eros, @new_pup]
    @app1.pets << [@doge, @new_pup]
  end

  # describe "I see a section titled ~Action Required~" do
  #   describe "I see a list of all pets that have a pending application and" do
  #     it "Has not been marked ~approved or rejected~" do
  #       visit "/applications/#{@app1.id}"
  #       fill_in "search", :with => "Cute Dog"
  #       click_button("Search Pets")
  #       fill_in "description", :with => "I love doggos"
  #       click_button("Submit Application")
  #       visit "/admin/shelters/#{@shelter1.id}"
  #       within("#action-required") do
  #         expect(page).to have_content(@eros.name)
  #       end
  #     end
  #   end
  #
  #   describe "Next to each pets name there is a link" do
  #     it "Takes you to admin app show page where you can accept or reject pet" do
  #       visit "/applications/#{@app1.id}"
  #       fill_in "search", :with => "Cute Dog"
  #       click_button("Search Pets")
  #       fill_in "description", :with => "I love doggos"
  #       click_button("Submit Application")
  #       visit "/admin/shelters/#{@shelter1.id}"
  #       within("#action-required") do
  #         expect(page).to have_content(@eros.name)
  #         expect(page).to have_link("Review Pet")
  #         click_link("Review Pet")
  #       end
  #       expect(current_path).to eq("/admins/applications/#{@app_b.id}")
  #       within("#admin-pet-#{@eros.id}") do
  #         expect(page).to have_button("Approve Application")
  #         expect(page).to have_button("Reject Application")
  #       end
  #     end
    # end
  # end
end