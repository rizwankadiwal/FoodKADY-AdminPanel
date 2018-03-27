class Category < ApplicationRecord
  has_many :categories_products
  has_many :products, through: :categories_products
  validates :category_name, presence: true
  has_attached_file :category_image, styles: {cover:"850x360>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :category_image, content_type: /\Aimage\/.*\z/
  extend ActsAsTree::TreeView
  acts_as_tree order: "category_name"
end
