json.array!(@levels) do |level|
  json.extract! level, :title
  json.url level_url(level, format: :json)
end