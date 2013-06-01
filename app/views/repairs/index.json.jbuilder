json.array!(@repairs) do |repair|
  json.extract! repair, :name, :start_date, :end_date, :tool_id
  json.url repair_url(repair, format: :json)
end