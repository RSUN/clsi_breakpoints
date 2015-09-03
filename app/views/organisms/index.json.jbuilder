json.array!(@organisms) do |organism|
  json.extract! organism, :id, :code, :name, :species, :sub_species, :organism_group, :master_group, :viridans_group, :level1, :level2, :level3, :level4
  json.url organism_url(organism, format: :json)
end
