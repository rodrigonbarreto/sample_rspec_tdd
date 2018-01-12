class Category < ApplicationRecord

  validates :description, presence: true
  has_many :products
end
