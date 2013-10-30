json.array!(@posts) do |post|
  json.extract! post, :description, :kind, :pet_id, :name, :address, :photo
  json.url post_url(post, format: :json)
end
