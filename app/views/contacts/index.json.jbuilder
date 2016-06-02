json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :email, :age, :stage, :office
  json.url contact_url(contact, format: :json)
end
