class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_apps = @application.pet_applications.includes(:pet)
  end

  def update
    @application = Application.find(params[:id])
    if params[:approve]
      pet_app = PetApplication.find_specific_and_approve(approve_params)
      pet_app.first.pet.approve
      redirect_to "/admins/applications/#{@application.id}?approve=yes&pet_id=#{params[:approve]}"
    elsif params[:reject]
      pet_app = PetApplication.find_specific_and_reject(reject_params)
      if pet_app
        pet_app.first.pet.reject
      end
      redirect_to "/admins/applications/#{@application.id}?approve=no&pet_id=#{params[:approve]}"
    end
  end

  private

  def approve_params
    params.permit(:approve, :id)
  end

  def reject_params
    params.permit(:reject, :id)
  end
end
