json.array!(@job_categories) do |job_category|
  json.extract! job_category, :title, :icon
  json.url job_category_url(job_category, format: :json)
end