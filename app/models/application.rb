class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zipcode
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def approved?
    approved = pets.where(adoptable: false, status: true)
    if approved.length == pets.length
      update(status: "Approved")
      self
    # elsif
    end
  end
end
