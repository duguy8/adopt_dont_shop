class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zipcode
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def find_petapp(new_id)
    pet_applications.where(application_id: self.id).where(pet_id: new_id)
  end

  def all_pets_approved?
    pet_applications.where(approved: "pending")
    # require "pry"; binding.pry
  end
end
