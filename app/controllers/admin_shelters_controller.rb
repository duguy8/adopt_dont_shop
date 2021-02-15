class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_by_name
  end

  def show
    @shelter = Shelter.find(params[:id])
  end
end
