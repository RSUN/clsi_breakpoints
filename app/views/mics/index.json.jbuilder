json.array!(@mics) do |mic|
  json.extract! mic, :id, :isolate_id, :drug_id, :value, :edge
  json.url mic_url(mic, format: :json)
end
