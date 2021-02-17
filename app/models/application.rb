class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zipcode
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  # before_create do
  #   self.status = "In Progress"
  # end

  def approved?
    approved = pets.where(adoptable: false, status: true)
    if approved.length == pets.length
      update(status: "Approved")
      self
    end
  end
end
