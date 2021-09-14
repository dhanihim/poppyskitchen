json.extract! scheduled_product, :id, :current_cost, :current_price, :created_at, :updated_at
json.url scheduled_product_url(scheduled_product, format: :json)
