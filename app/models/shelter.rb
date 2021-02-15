class Shelter < ApplicationRecord
  has_many :pets

  def self.reverse_by_name
    order("lower(name) DESC").all
  end
end
