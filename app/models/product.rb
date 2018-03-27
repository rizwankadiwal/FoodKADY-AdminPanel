class Product < ApplicationRecord
  has_many :categories_products
  has_many :categories, through: :categories_products
  accepts_nested_attributes_for :categories_products, allow_destroy: true;
  validates :product_name, :sku, :price, :is_available,:stock_quantity, :taxable_class, presence: true
  validates :price,:cost, numericality: {greater_than: 0}
  validates :stock_quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  has_attached_file :product_image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/
end
