json.array!(@isolates) do |isolate|
  json.extract! isolate, :id, :isolate_id, :collection, :site, :study_year, :bank, :organism_code
  json.url isolate_url(isolate, format: :json)
end
