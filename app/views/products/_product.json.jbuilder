json.extract! product, :id, :product_name, :sku, :is_available, :taxable_class, :description, :price, :cost, :notes, :created_at, :updated_at
json.url product_url(product, format: :json)
