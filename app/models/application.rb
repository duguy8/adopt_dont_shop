class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zipcode
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  before_create do
    self.status = "In Progress"
    normalize
  end

  def status_check
    if pet_applications.where(approved: 2).count == pet_applications.count
      "Approved"
    elsif pet_applications.where(approved: 1).count >= 1
      "Rejected"
    else
      "Pending"
    end
  end

  private

  def normalize
    self.name = name.downcase.titleize
    self.city = city.downcase.titleize
    self.state = state.upcase
  end
end
