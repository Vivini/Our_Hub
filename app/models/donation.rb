class Donation < ApplicationRecord
  belongs_to :user
  has_many :categories, through: :donation_categories
  has_many_attached :photos
end
