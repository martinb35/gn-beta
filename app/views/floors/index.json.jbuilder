json.array!(@floors) do |floor|
  json.extract! floor, :title
  json.url floor_url(floor, format: :json)
end