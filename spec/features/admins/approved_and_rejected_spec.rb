require 'rails_helper'

RSpec.describe 'When there are two apps for one pet' do
  before :each do
    @app1 = create(:application)
    @app2 = create(:application)
    @shelter = create(:shelter, id: 1)
    @eros = create(:pet, shelter_id: 1)
    @app1.pets << [@eros]
    @app2.pets << [@eros]
  end

  describe "When I approve a pet on first apps show page" do
    describe "And visit other apps admin show page" do
      it "Shows the pet and can be approved/rejected" do
        visit "/admins/applications/#{@app1.id}"
        click_button("Approve Application")
        visit "/admins/applications/#{@app2.id}"
        within("#admin-pet-#{@eros.id}") do
          expect(page).to have_button("Approve Application")
          expect(page).to have_button("Reject Application")
          expect(page).to have_content(@eros.name)
        end
      end
    end
  end
end
