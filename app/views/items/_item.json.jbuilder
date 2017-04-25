json.extract! item, :id, :title, :description, :starting_price, :end_time, :created_at, :updated_at, :sport, :charity, :sponsor
json.url item_url(item, format: :json)
