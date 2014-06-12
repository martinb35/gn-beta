json.array!(@services) do |service|
  json.extract! service, :title, :icon
  json.url service_url(service, format: :json)
end