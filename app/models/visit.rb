class Visit < ApplicationRecord
  has_many :donations, through: :reservations
end
