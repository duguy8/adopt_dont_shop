class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zipcode
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def status_check
    if pet_applications.where(approved: 2).count == pet_applications.count
      "Approved"
    elsif pet_applications.where(approved: 1).count == pet_applications.count
      "Rejected"
    else
      "Pending"
    end
  end
end
