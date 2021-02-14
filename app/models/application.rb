class Application < ApplicationRecord
  validates_presence_of :name, :street_address, :city, :state, :zipcode
  has_many :pet_applications
  has_many :pets, through: :pet_applications
end
