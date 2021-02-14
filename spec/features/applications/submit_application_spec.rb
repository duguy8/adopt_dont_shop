require 'rails_helper'

RSpec.describe 'As a vistor' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
    @app1.pets << @eros
  end

  describe "When I am on an applications show page" do
    describe "I add a pet and complete description section" do
      it "Taken back to apps show page after submiting" do
        visit "/applications/#{@app1.id}"

        expect(@app1.pets.count).to eq 1
        within("#description_submit") do
          expect(page).to have_button("Submit Application")
        end
        fill_in "description", :with => "I love doggos"
        click_button("Submit Application")
        expect(current_path).to eq("/applications/#{@app1.id}")
        expect(page).to have_content("I love doggos")
        expect(page).to have_content("Pending")
        expect(page).to have_content(@eros.name)
      end
    end
  end
end
