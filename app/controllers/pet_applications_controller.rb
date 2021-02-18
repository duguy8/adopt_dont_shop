class PetApplicationsController < ApplicationController
  def create
    pet_app = PetApplication.new(
      application: Application.find(params[:id]),
      pet: Pet.find(params[:pet_id]),
      approved: 0
    )
    pet_app.pet.update({status: true})
    if pet_app.save
      flash[:notice] = "#{pet_app.pet.name} has been added to your application"
      redirect_to "/applications/#{pet_app.application.id}"
    end
  end
end
