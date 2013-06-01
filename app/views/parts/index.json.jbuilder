json.array!(@parts) do |part|
  json.extract! part, :name, :sku, :tool_id, :price, :po, :repair_id, :service_id
  json.url part_url(part, format: :json)
end