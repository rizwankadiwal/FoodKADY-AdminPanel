class Product < ApplicationRecord
  validates :product_name, :sku, :price, :is_available, :taxable_class, presence: true
  validates :price,:cost, numericality: {greater_than: 0}
  has_attached_file :product_image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/
end
