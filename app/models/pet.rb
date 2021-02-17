class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :description, :approximate_age, :sex
  has_many :pet_applications
  has_many :applications, through: :pet_applications

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  def self.search(input)
    where("name ILIKE ?", "%#{input[:search]}%")
  end

  def approved_app
    return true if applications.where(status: "Approved").count >= 1
  end

  def app_review
    applications.where(status: "Pending").pluck(:id)
  end
end
