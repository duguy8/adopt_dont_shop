class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def update
    if params[:approve]
      @application = Application.find(params[:id])
      @pet = @application.pets.find(params[:approve])
      @pet.update({status: true, adoptable: false})
      @pet.save
      @application.approved?
      redirect_to "/admins/applications/#{@application.id}?approve=yes&pet_id=#{@pet.id}"
    elsif params[:reject]
      @application = Application.find(params[:id])
      @pet = @application.pets.find(params[:reject])
      @pet.update({adoptable: false})
      @pet.save
      @application.update({status: "Rejected"})
      @application.save
      redirect_to "/admins/applications/#{@application.id}?approve=no&pet_id=#{@pet.id}"
    end
  end
end
