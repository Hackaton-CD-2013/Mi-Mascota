json.array!(@pets) do |pet|
  json.extract! pet, :name, :race, :string, :birth, :weight, :habits, :user_id, :kind
  json.url pet_url(pet, format: :json)
end
