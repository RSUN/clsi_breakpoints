require 'test_helper'

class TestreactionTest < ActiveSupport::TestCase

 #  Testreaction.first
 #  Testreaction Load (0.3ms)  SELECT  "testreactions".* FROM "testreactions"  ORDER BY "testreactions"."id" ASC LIMIT 1
 # => #<Testreaction id: 1, authority: "CLSI", publication: 2015, delivery_mechanism: nil, infection_type: nil, isolate_id: 24752, drug_id: 1020, reaction: "S", footnote: "Breakpoints from FDA Package Insert", eligible_interpretations: "S R", rule_row_number: 6, used_surrogate_drug_id: 0, used_surrogate_drug_ordinal: "NULL", used_surrogate_rule_type: "NULL", created_at: "2015-09-05 15:37:34", updated_at: "2015-09-05 15:37:34"> 
 #  Testreaction.second
 #  Testreaction Load (0.2ms)  SELECT  "testreactions".* FROM "testreactions"  ORDER BY "testreactions"."id" ASC LIMIT 1 OFFSET 1
 # => #<Testreaction id: 2, authority: "CLSI", publication: 2015, delivery_mechanism: nil, infection_type: nil, isolate_id: 20614, drug_id: 1020, reaction: "S", footnote: "Breakpoints from FDA Package Insert", eligible_interpretations: "S R", rule_row_number: 6, used_surrogate_drug_id: 0, used_surrogate_drug_ordinal: "NULL", used_surrogate_rule_type: "NULL", created_at: "2015-09-05 15:37:34", updated_at: "2015-09-05 15:37:34"> 
 #   Testreaction.third
 #  Testreaction Load (0.5ms)  SELECT  "testreactions".* FROM "testreactions"  ORDER BY "testreactions"."id" ASC LIMIT 1 OFFSET 2
 # => #<Testreaction id: 3, authority: "CLSI", publication: 2015, delivery_mechanism: nil, infection_type: nil, isolate_id: 24752, drug_id: 1008, reaction: "S", footnote: "NULL", eligible_interpretations: "S I R", rule_row_number: 8, used_surrogate_drug_id: 0, used_surrogate_drug_ordinal: "NULL", used_surrogate_rule_type: "NULL", created_at: "2015-09-05 15:37:34", updated_at: "2015-09-05 15:37:34"> 

  test "Reaction one based on existing data" do
  
   control = Testreaction.first
   puts control.inspect
   puts "-------------------------"
   
   test_mic = Mic.where(isolate_id: control['isolate_id'], drug_id: control['drug_id']).first
   puts test_mic.inspect

   mic_drug = Drug.where(drugid: test_mic['drug_id']).first
   puts mic_drug.inspect

   mic_isolate = Isolate.where(isolate_id: test_mic['isolate_id']).first
   puts mic_isolate.inspect

   mic_organism = Organism.where(code: mic_isolate['organism_code']).first
   puts mic_organism.inspect

   mic_breakpoint = Breakpoint.where(drug: mic_drug['name'],master_group_include: mic_organism['master_group']).first
   puts mic_breakpoint.inspect

   ### build new reaction
   reaction = ""
   reaction += "S" if test_mic['value'] <= mic_breakpoint['s_maximum']
   reaction += "R"  if test_mic['value'] >= mic_breakpoint['r_minimum']
   reaction += "I"  if test_mic['value'].between?(mic_breakpoint['s_maximum'],mic_breakpoint['r_minimum'])

   assert reaction == control['reaction']
   

   # Choose existing mic based on known result and make comparison   
   #Testreacion.first
     
  end

    test "Reaction two based on existing data" do
  
   control = Testreaction.second
   puts control.inspect
   puts "-------------------------"
   
   test_mic = Mic.where(isolate_id: control['isolate_id'], drug_id: control['drug_id']).first
   puts test_mic.inspect
   
   mic_drug = Drug.where(drugid: test_mic['drug_id']).first
   puts mic_drug.inspect

   mic_isolate = Isolate.where(isolate_id: test_mic['isolate_id']).first
   puts mic_isolate.inspect

   mic_organism = Organism.where(code: mic_isolate['organism_code']).first
   puts mic_organism.inspect

   mic_breakpoint = Breakpoint.where(drug: mic_drug['name'],master_group_include: mic_organism['master_group']).first
   puts mic_breakpoint.inspect

   ### build new reaction
   reaction = ""
   reaction += "S" if test_mic['value'] <= mic_breakpoint['s_maximum']
   reaction += "R"  if test_mic['value'] >= mic_breakpoint['r_minimum']
   reaction += "I"  if test_mic['value'].between?(mic_breakpoint['s_maximum'],mic_breakpoint['r_minimum'])

   assert reaction == control['reaction']
   

   # Choose existing mic based on known result and make comparison   
   #Testreacion.first
     
  end

    test "Reaction three based on existing data" do
  
   control = Testreaction.third
   puts control.inspect
   puts "-------------------------"
   
   test_mic = Mic.where(isolate_id: control['isolate_id'], drug_id: control['drug_id']).first
   puts test_mic.inspect
   
   mic_drug = Drug.where(drugid: test_mic['drug_id']).first
   puts mic_drug.inspect

   mic_isolate = Isolate.where(isolate_id: test_mic['isolate_id']).first
   puts mic_isolate.inspect

   mic_organism = Organism.where(code: mic_isolate['organism_code']).first
   puts mic_organism.inspect

   mic_breakpoint = Breakpoint.where(drug: mic_drug['name'],master_group_include: mic_organism['master_group']).first
   puts mic_breakpoint.inspect

   ### build new reaction
   reaction = ""
   reaction += "S" if test_mic['value'] <= mic_breakpoint['s_maximum']
   reaction += "R"  if test_mic['value'] >= mic_breakpoint['r_minimum']
   reaction += "I"  if test_mic['value'].between?(mic_breakpoint['s_maximum'],mic_breakpoint['r_minimum'])

   puts reaction

   assert reaction == control['reaction']
   

   # Choose existing mic based on known result and make comparison   
   #Testreacion.first
     
  end


end
