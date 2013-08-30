json.array!(@users) do |user|
  json.extract! user, :name, :email, :password_digest, :adress, :latitude, :longitude, :phone_number, :github_id, :twiter_id, :fb_id
  json.url user_url(user, format: :json)
end
