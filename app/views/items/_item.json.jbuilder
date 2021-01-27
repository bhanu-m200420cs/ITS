json.extract! item, :id, :item_name, :model_number, :make, :installation_date, :warranty, :status, :created_at, :updated_at
json.url item_url(item, format: :json)
