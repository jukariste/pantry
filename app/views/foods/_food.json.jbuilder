json.extract! food, :id, :name, :kcal, :created_at, :updated_at
json.url food_url(food, format: :json)
