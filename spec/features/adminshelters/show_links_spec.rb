require 'rails_helper'

RSpec.describe 'When I visit "/admin/shelters"' do
  before :each do
    @shelter1 = create(:shelter, name: "Tampa Shelter", id: 1)
    @shelter2 = create(:shelter, name: "Max Fund", id: 2)
    @shelter3 = create(:shelter, name: "A Fund", id: 3)
  end

  describe "Every shelter name is a link" do
    it "Takes me to that shelters admin show page" do
      visit "/admin/shelters"
      expect(page).to have_link("Tampa Shelter")
      expect(page).to have_link("Max Fund")
      expect(page).to have_link("A Fund")
      click_link("Max Fund")
      expect(current_path).to eq("/admin/shelters/#{@shelter2.id}")
    end
  end
end
