class Product < ApplicationRecord
  belongs_to :user , optional: true
  has_many :images, dependent: :destroy
  
  validates :name, :description, :category, :price, :condition, :shipping_charge, :shipping_area, :shipping_day, presence: true
  validates :name, length: { maximum: 40 }
  validates :price, length: { minimum: 3 }
  accepts_nested_attributes_for :images, allow_destroy: true
end
