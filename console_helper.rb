def find_breakpoint(isolate, drug)
test_mic = Mic.where(isolate_id: isolate, drug_id: drug).first
mic_drug = Drug.where(drugid: test_mic['drug_id']).first
mic_isolate = Isolate.where(isolate_id: test_mic['isolate_id']).first
mic_organism = Organism.where(code: mic_isolate['organism_code']).first
puts "-- Mic to test --"
puts test_mic.inspect
puts "-- drug found -- "
puts mic_drug.inspect
puts "-- isolate found --"
puts mic_isolate.inspect
puts "-- organism found --"
puts mic_organism.inspect
end

def multiple_breakpoints(drug,master)
	columns = Breakpoint.column_names
 Breakpoint.where(drug: drug, master_group_include: master).each do |brek|
     columns.each do |name|
        puts "#{name}: #{brek[name]}" if brek[name].present?
     end
    end
end
