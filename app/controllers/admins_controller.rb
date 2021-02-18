class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def update
    if params[:approve]
      @application = Application.find(params[:id])
      @pet_app = @application.find_petapp(params[:approve])
      @pet_app.approve
      # require "pry"; binding.pry
      if @application.all_pets_approved?.empty?
        @application.update(status: "Approved")
      end
      Pet.find(params[:approve]).update(adoptable: false, status: true)
      redirect_to "/admins/applications/#{@application.id}?approve=yes&pet_id=#{params[:approve]}"
    elsif params[:reject]
      @application = Application.find(params[:id])
      @pet = @application.pets.find(params[:reject])
      @pet.update({adoptable: false})
      # @pet.save
      pet_app = @pet.pet_applications
      pet_app.update(approved: 1)
      @application.update({status: "Rejected"})
      # @application.save
      redirect_to "/admins/applications/#{@application.id}?approve=no&pet_id=#{@pet.id}"
    end
  end
end
