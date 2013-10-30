json.array!(@pets) do |pet|
  json.extract! pet, :name, :race, :birth, :weight, :habits, :user_id, :kind, :photo
  json.url pet_url(pet, format: :json)
end
