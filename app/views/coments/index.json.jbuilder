json.array!(@coments) do |coment|
  json.extract! coment, 
  json.url coment_url(coment, format: :json)
end
