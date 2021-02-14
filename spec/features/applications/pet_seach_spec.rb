require 'rails_helper'

RSpec.describe 'As a vistor' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, name: "Cute Dog", shelter_id: 1)
    @doge2 = create(:pet, name: "fluff", shelter_id: 1)
    @doge3 = create(:pet, name: "fluffy", shelter_id: 1)
    @doge4 = create(:pet, name: "mr.fluff", shelter_id: 1)
  end

  describe "On the applications show page" do
    describe "It has a section to add pet to application" do
      it "Has input where you can search for pets by name" do

        visit "/applications/#{@app1.id}"
        within("#search_pets") do
          expect(page).to have_button("Search Pets")
        end
        fill_in "search", :with => "Cute Dog"
        click_button("Search Pets")
        expect(current_path).to eq("/applications/#{@app1.id}")
        expect(page).to have_content(@doge.name)
      end

      it 'Can return partial matches' do
        visit "/applications/#{@app1.id}"
        fill_in "search", :with => "fluff"
        click_button("Search Pets")
        # save_and_open_page
        expect(page).to have_content(@doge2.name)
        expect(page).to have_content(@doge3.name)
        expect(page).to have_content(@doge4.name)
      end
    end
  end
end
