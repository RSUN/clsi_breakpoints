json.array!(@reactions) do |reaction|
  json.extract! reaction, :id, :authority, :publication, :delivery_mechanism, :infection_type, :isolate_id, :drug_id, :reaction, :footnote, :eligible_interpretations, :rule_row_number, :used_surrogate_drug_id, :used_surrogate_drug_ordinal, :used_surrogate_rule_type
  json.url reaction_url(reaction, format: :json)
end
