class Product < ApplicationRecord
  has_many :categories_products
  has_many :categories, through: :categories_products
  accepts_nested_attributes_for :categories_products, allow_destroy: true;
  validates :product_name, :sku, :price, :cost, :is_available, :stock_quantity,
            :taxable_class, presence: true
  validates :price,:cost, numericality: {greater_than: 0}
  validates :stock_quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  has_attached_file :product_image, default_url: "/images/:style/missing.png", :url => "/assets/storage/:basename.:extension"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product = find_by_id(row['id']) || new
      product.attributes = row.to_hash.slice(*accessible_attributes)
      product.save!
    end
  end
end
