json.array!(@bathrooms) do |bathroom|
  json.extract! bathroom, :title
  json.url bathroom_url(bathroom, format: :json)
end