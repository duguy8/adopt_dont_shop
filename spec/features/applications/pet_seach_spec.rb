require 'rails_helper'

RSpec.describe 'As a vistor' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, name: "Cute Dog", shelter_id: 1)
    @doge2 = create(:pet, name: "What a dog", shelter_id: 1)
    @app1.pets << @eros
  end

  describe "On the applications show page" do
    describe "It has a section to add pet to application" do
      it "has input where you can search for pets by name" do

        visit "/applications/#{@app1.id}"
        within("#search_pets") do
          expect(page).to have_button("Search Pets")
        end
        fill_in "search", :with => "Cute Dog"
        click_button("Search Pets")
        save_and_open_page
        expect(current_path).to eq("/applications/#{@app1.id}")
        expect(page).to have_content(@doge.name)
      end
    end
  end
end
