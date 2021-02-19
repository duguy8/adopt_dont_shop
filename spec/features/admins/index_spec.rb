require 'rails_helper'

RSpec.describe 'When I visit the admin applications index' do
  before :each do
    @app1 = create(:application)
    @app2 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1, name: "Eros")
    @doge = create(:pet, shelter_id: 1)
  end

  describe "It has all the applications" do
    it 'Shows the application and link to the show page' do
      visit "/admins"
      expect(page).to have_content(@app1.name)
      expect(page).to have_content(@app2.name)
    end
  end
end
