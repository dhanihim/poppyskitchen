json.extract! ordered_product, :id, :price, :profit, :total, :description, :created_at, :updated_at
json.url ordered_product_url(ordered_product, format: :json)
