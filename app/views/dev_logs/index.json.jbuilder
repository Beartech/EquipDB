json.array!(@dev_logs) do |dev_log|
  json.extract! dev_log, :note, :user_id
  json.url dev_log_url(dev_log, format: :json)
end