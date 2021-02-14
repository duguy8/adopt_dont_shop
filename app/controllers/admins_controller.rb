class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def approve
    if params[:approve]
      @application = Application.find(params[:id])
      @pet = @application.pets.find(params[:approve])
      redirect_to "/admins/applications/#{@application.id}?approve=yes&pet_id=#{@pet.id}"
    elsif params[:reject]
      @application = Application.find(params[:id])
      @pet = @application.pets.find(params[:reject])
      redirect_to "/admins/applications/#{@application.id}?approve=no&pet_id=#{@pet.id}"
    end
  end
end
