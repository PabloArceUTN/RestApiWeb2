json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :firstname, :token, :valid_up, :active
  json.url user_url(user, format: :json)
end
