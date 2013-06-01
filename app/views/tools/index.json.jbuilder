json.array!(@tools) do |tool|
  json.extract! tool, :name, :serial, :location, :purchased, :put_in_service, :cost, :value, :in_service, :retired
  json.url tool_url(tool, format: :json)
end