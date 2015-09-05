require 'test_helper'

class MicTest < ActiveSupport::TestCase
     test "build isolate relations based on existing Mic data" do
 	    # retrieve uplink isolate relation for 3 mic results by isolate id
 	    # first mic record 41907 => Organism_code => SA => Organism => Staphylococcus aureus
 	    # first mic record 46226 => Organism_code => MM => Organism => Morganella morganii
 	    # first mic record 46455 => Organism_code => ECL => Organism => Enterobacter cloacae
           

 	    firstorganism = get_organism_relation(isolate_id_to_rails_id(41907))
 	       assert firstorganism.name == 'Staphylococcus aureus'
 	    secondorganism = get_organism_relation(isolate_id_to_rails_id(46226))
 	       assert secondorganism.name == 'Morganella morganii'
 	    thirdorganism = get_organism_relation(isolate_id_to_rails_id(46455))
 	       assert thirdorganism.name == 'Enterobacter cloacae'     
	 end

	 test "build drug relations based on existing Mic data" do
	 	# retrieve uplink drug relation for same 3 mic results from isolate test. 
	 	# first result for each isolate ordered by activerecord id
	 	# Mic.joins(:drug).where(isolate_id: '41917').pluck(:drug_id).first
	 	# 41907 => Drug_id => 1013 => Azithromycin
 	    # 46226 => drug_id => 1050 => Colistin
 	    # 46455 => drug_id => 1026 => Azithromycin

	 end

end
