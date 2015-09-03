json.array!(@breakpoints) do |breakpoint|
  json.extract! breakpoint, :id, :drug, :s_maximum, :r_minimum, :surrogate_drugs, :r_if_surrogate_is, :ni_if_surrogate_is, :r_if_blt_is, :delivery_mechanism, :infection_type, :footnote, :master_group_include, :organism_group_include, :viridans_group_include, :genus_include, :genus_exclude, :organism_code_include, :organism_code_exclude, :gram_include, :level_1_include, :level_3_include, :level_3_exclude
  json.url breakpoint_url(breakpoint, format: :json)
end
