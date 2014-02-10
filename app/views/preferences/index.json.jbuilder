json.array!(@preferences) do |preference|
  json.extract! preference, :user_id, :notification_category_id, :check
  json.url preference_url(preference, format: :json)
end