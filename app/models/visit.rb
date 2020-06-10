class Visit < ApplicationRecord
  has_many :donations, through: :reservations
  has_many :reservations
end
