class AdminSheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_by_name
    if !@shelters.first.pets.empty?
      @pending = Shelter.pending_apps
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
  end
end
