class Shelter < ApplicationRecord
  has_many :pets

  def self.reverse_by_name
    order("lower(name) DESC").all
  end

  def self.pending_apps
    find_each do |shelter|
      Pet.pending?(shelter)
    end
    order(:name)
  end
end
