require 'rails_helper'

RSpec.describe 'As a visitor on an admin shelter show page' do
  before :each do
    @shelter1 = create(:shelter, name: "Tampa Shelter")
    @shelter2 = create(:shelter, name: "Max Fund")
    @shelter3 = create(:shelter, name: "cool shelta")
    @shelter4 = create(:shelter, name: "Denver Shelter")
  end

  it "Shows the shelters name and full address" do
    visit "/admin/shelters/#{@shelter1.id}"
    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter1.address)
    expect(page).to have_content(@shelter1.city)
    expect(page).to have_content(@shelter1.state)
    expect(page).to have_content(@shelter1.zip)
  end
end
