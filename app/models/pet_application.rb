class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  enum approved: [ :pending, :rejected, :approved ]
end
