class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :description, :approximate_age, :sex
  has_many :pet_applications
  has_many :applications, through: :pet_applications

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  before_save :normalize_name

  def self.search(input)
    where("name ILIKE ?", "%#{input[:search]}%")
  end

  def approve
    update(adoptable: false)
  end

  def reject
    update(adoptable: false, status: false)
  end

  private

  def normalize_name
    self.name = name.downcase.titleize
  end
end
