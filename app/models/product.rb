class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :category
  
  validates :name, :description, :category, :brand, :price, :condition, :shipping_charge, :shipping_area, :shipping_day, presence: true
  validates :price, length: { minimum: 3 }
  accepts_nested_attributes_for :images, allow_destroy: true
end
