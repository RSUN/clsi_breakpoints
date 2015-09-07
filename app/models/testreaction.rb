class Testreaction < ActiveRecord::Base

  def self.calc_breakpoint(drugname=@mic_drug['name'])
  	# this blew up in the course of failed tests and thats when I knew it was time to walk away.
   case 1
   when Breakpoint.where(drug: drugname,master_group_include: @mic_organism['master_group']).count
     Breakpoint.where(drug: drugname,master_group_include: @mic_organism['master_group']).first
   when Breakpoint.where(drug: drugname,genus_include: @mic_organism['genus']).count
     Breakpoint.where(drug: drugname,genus_include: @mic_organism['genus']).first
   when Breakpoint.where(drug: drugname).where('organism_code_include LIKE ?', "%#{@mic_isolate['organism_code']}%").count
      Breakpoint.where(drug: drugname).where('organism_code_include LIKE ?', "%#{@mic_isolate['organism_code']}%").first
   when Breakpoint.where(drug: drugname).where('organism_code_include LIKE ?', "#{@mic_isolate['organism_code']}").count
      Breakpoint.where(drug: drugname).where('organism_code_include LIKE ?', "#{@mic_isolate['organism_code']}").first
   when Breakpoint.where(drug: drugname,level_1_include: @mic_organism['level1']).count
     Breakpoint.where(drug: drugname,level_1_include: @mic_organism['level1']).first
   when Breakpoint.where(drug: drugname,level_3_include: @mic_organism['level3']).count
     Breakpoint.where(drug: drugname,level_3_include: @mic_organism['level3']).first
   else
   	## Temp diagnostic purposes
   	puts "-------------- DID NOT FIND BREAKPOINT -------------"
   	puts @test_mic.inspect
   	puts "----------------------------------------------------"
   	## end temp, don't forget to remove else
   end

  end

  def self.calc_reaction(breakpoint)
  	# need to cleanup, calling to_f to avoid cooercian errors
   return reaction = "S" if @test_mic['value'] < breakpoint['s_maximum'].to_f
   return reaction = "R"  if @test_mic['value'] > breakpoint['r_minimum'].to_f
   return reaction = "S" if breakpoint['s_maximum'].to_f == 0.0 && breakpoint['r_minimum'].to_f == 0.0
   return reaction = "I"  if @test_mic['value'].between?(breakpoint['s_maximum'].to_f,breakpoint['r_minimum'].to_f) 
   return "R" 
  end

  def self.calc_surrogate_reaction(breakpoint)
  	# remove rescue? revisit depending on tests
       surrogate = breakpoint['surrogate_drugs'].split(",").to_a
       surrogate.each{|drugname|
     begin
        surbreakpoint = calc_breakpoint(drugname)     
        reactiontest = calc_reaction(surbreakpoint)  
        if breakpoint['r_if_surrogate_is'].include? reactiontest
        	return "R" 
        else
        	return "S"
        end
    rescue
    	return "S"
     end     
      }
  end


 def self.find_reaction(control)
   @test_mic = Mic.where(isolate_id: control['isolate_id'], drug_id: control['drug_id']).first
   @mic_drug = Drug.where(drugid: @test_mic['drug_id']).first
   @mic_isolate = Isolate.where(isolate_id: @test_mic['isolate_id']).first
   @mic_organism = Organism.where(code: @mic_isolate['organism_code']).first

    if !calc_breakpoint['surrogate_drugs'].present?
     return reaction = calc_reaction(calc_breakpoint) 
    end

    if calc_breakpoint['surrogate_drugs'].present?
     return reaction = calc_surrogate_reaction(calc_breakpoint)
    end

  end


end
