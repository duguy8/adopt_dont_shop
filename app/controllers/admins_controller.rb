class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def approve
    @application = Application.find(params[:id])
    pet = @application.pets.find(params[:approve])
    pet.update(
      status: true
    )
    redirect_to "/admins/applications/#{@application.id}"
  end
end
