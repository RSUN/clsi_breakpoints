json.array!(@drugs) do |drug|
  json.extract! drug, :id, :id, :name, :description
  json.url drug_url(drug, format: :json)
end
