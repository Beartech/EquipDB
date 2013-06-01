json.array!(@services) do |service|
  json.extract! service, :name, :due_date, :completed, :tool_id
  json.url service_url(service, format: :json)
end