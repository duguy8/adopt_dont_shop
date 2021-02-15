class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_by_name
  end
end
