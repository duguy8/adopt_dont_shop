require 'rails_helper'

RSpec.describe 'As a vistor when I visit an app show page' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, name: "Cute Dog", shelter_id: 1)
    @doge2 = create(:pet, name: "What a dog", shelter_id: 1)
  end

  describe "After I search for a pet" do
    describe "Has a link to ~Adopt this Pet~ button next to each pet" do
      it "Takes me back to app show page where it shows the pet" do
        visit "/applications/#{@app1.id}"
        fill_in "search", :with => "Cute Dog"
        click_button("Search Pets")
        within("#pet-#{@doge.id}") do
          expect(page).to have_button("Adopt this Pet")
        end
        click_button("Adopt this Pet")
        expect(current_path).to eq("/applications/#{@app1.id}")
        within("#pet_section") do
          expect(page).to have_content(@doge.name)
        end
      end
    end
  end
end
