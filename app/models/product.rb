class Product < ApplicationRecord
  has_many :images
  validates :name, :description, :category, :brand, :price, :condition, :shipping_charge, :shipping_area, :shipping_day, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
