require 'rails_helper'

RSpec.describe 'When I visit an admin app show page' do
  before :each do
    @app1 = create(:application)
    @app2 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1)
    @app1.pets << [@eros]
  end

  describe "When all pets are approved for an application" do
    describe "Im taken back to the admin app show page" do
      it "Shows the applications status is now ~Approved~" do
        expected = "Approved"
        visit "/admins/applications/#{@app1.id}"
        click_button("Approve Application")
        expect(current_path).to eq("/admins/applications/#{@app1.id}")
        within(".stats") do
          expect(page).to have_content("Approved")
        end
      end
    end
  end
end
