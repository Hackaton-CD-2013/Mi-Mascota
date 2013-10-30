json.array!(@services) do |service|
  json.extract! service, :name, :address, :description, :latitude, :longitude, :category_id
  json.url service_url(service, format: :json)
end
