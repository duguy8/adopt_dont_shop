class Shelter < ApplicationRecord
  has_many :pets

  def self.reverse_by_name
    order("lower(name) DESC").all
  end

  def self.pending_apps
    joins(:pets).where('pets.status = ?', "true").order(:name)
  end

  def average_age
    pets.average(:approximate_age)
  end

  def adoptable_pets
    pets.where(adoptable: true)
  end
end
