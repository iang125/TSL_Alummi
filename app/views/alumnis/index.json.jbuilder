json.array!(@alumnis) do |alumni|
  json.extract! alumni, :tsl_key, :first_name, :last_name
  json.url alumni_url(alumni, format: :json)
end
