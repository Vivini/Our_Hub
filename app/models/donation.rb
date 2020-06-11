class Donation < ApplicationRecord
  geocoded_by :address
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :donation_categories
  has_many :categories, through: :donation_categories
  has_one_attached :photo
end