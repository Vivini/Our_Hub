class Donation < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :donation_categories
  has_many :categories, through: :donation_categories
  has_many_attached :photos
end
