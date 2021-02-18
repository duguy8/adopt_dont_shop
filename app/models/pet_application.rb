class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  enum approved: [ :pending, :rejected, :approved ]

  def self.approve
    update(approved: 2)
  end

  def self.all_approved?
    where(approved: 0)
  end
end
