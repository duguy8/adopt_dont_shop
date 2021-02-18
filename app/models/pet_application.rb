class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  enum approved: [ :pending, :rejected, :approved ]

  def self.find_specific_and_approve(approve_params)
    app = where(application_id: approve_params[:id]).where(
      pet_id: approve_params[:approve]
    )
    app.update(approved: 2)
  end

  def self.find_specific_and_reject(reject_params)
    app = where(application_id: reject_params[:id]).where(
      pet_id: reject_params[:reject]
    )
    app.update(approved: 1)
  end

  def self.need_reviewed?(pet_id)
    pet = Pet.find(pet_id)
    app = pet.pet_applications.where(approved: 0)
    app.first.application_id
  end
end
