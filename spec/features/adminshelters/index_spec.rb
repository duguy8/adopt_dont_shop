require 'rails_helper'

RSpec.describe 'As a visitor on the admin shelter index' do
  before :each do
    @shelter1 = create(:shelter, name: "Tampa Shelter")
    @shelter2 = create(:shelter, name: "Max Fund")
    @shelter3 = create(:shelter, name: "cool shelta")
    @shelter4 = create(:shelter, name: "Denver Shelter")
  end

  it "Shows each shelter in reverse alphabetical order by name" do
    visit "/admin/shelters"
    expect(@shelter1.name).to appear_before(@shelter2.name)
    expect(@shelter2.name).to appear_before(@shelter4.name)
    expect(@shelter4.name).to appear_before(@shelter3.name)
    expect(@shelter1.name).to appear_before(@shelter3.name)
  end
end
