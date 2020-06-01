class Reservation < ApplicationRecord
  belongs_to :donation
  belongs_to :visit
end
