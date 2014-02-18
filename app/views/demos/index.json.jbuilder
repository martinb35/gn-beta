json.array!(@demos) do |demo|
  json.extract! demo, :name
  json.url demo_url(demo, format: :json)
end