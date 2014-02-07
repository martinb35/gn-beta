json.array!(@notification_categories) do |notification_category|
  json.extract! notification_category, :notification, :category
  json.url notification_category_url(notification_category, format: :json)
end