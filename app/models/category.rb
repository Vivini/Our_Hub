class Category < ApplicationRecord
  has_many :donations, through: :donation_categories
end
