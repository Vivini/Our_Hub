class DonationCategory < ApplicationRecord
  belongs_to :category
  belongs_to :donation
end
