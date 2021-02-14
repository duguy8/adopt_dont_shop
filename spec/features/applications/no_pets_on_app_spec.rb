require 'rails_helper'

RSpec.describe 'As a vistor' do
  before :each do
    @app1 = create(:application)
    @shelter = create(:shelter, id: 1)
    @apollo = create(:pet, shelter_id: 1)
    @eros = create(:pet, shelter_id: 1)
    @doge = create(:pet, shelter_id: 1)
  end

  describe 'When I visit an applications show page with no pets' do
    it 'Does not show you section to submit the application' do
      visit "/applications/#{@app1.id}"
      within("#description_submit") do
        expect(page).not_to have_button("Submit Application")
      end
    end
  end
end
