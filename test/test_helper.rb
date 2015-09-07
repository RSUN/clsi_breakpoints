ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def isolate_id_to_rails_id(id)
  	Isolate.where(isolate_id: id).pluck(:id).first 	
  end

  def get_organism_relation(id)
	orgcode = Isolate.find(id).organism_code
    Organism.where(code: orgcode).first
  end

  def calc_breakpoint(drugname=@mic_drug['name'])
   case 1
   when Breakpoint.where(drug: drugname,master_group_include: @mic_organism['master_group']).count
     Breakpoint.where(drug: drugname,master_group_include: @mic_organism['master_group']).first
   when Breakpoint.where(drug: drugname,genus_include: @mic_organism['genus']).count
     Breakpoint.where(drug: drugname,genus_include: @mic_organism['genus']).first
   when Breakpoint.where(drug: drugname).where('organism_code_include LIKE ?', "%#{@mic_isolate['organism_code']}%").count
      Breakpoint.where(drug: drugname).where('organism_code_include LIKE ?', "%#{@mic_isolate['organism_code']}%").first
   end
  end

  def calc_reaction(breakpoint)
   reaction = ""
   reaction += "S" if @test_mic['value'] <= breakpoint['s_maximum']
   reaction += "R"  if @test_mic['value'] >= breakpoint['r_minimum']
   reaction += "I"  if @test_mic['value'].between?(breakpoint['s_maximum'],breakpoint['r_minimum'])
   reaction  
  end

  def calc_surrogate_reaction


  end

  def find_reaction(control)
   @test_mic = Mic.where(isolate_id: control['isolate_id'], drug_id: control['drug_id']).first
   @mic_drug = Drug.where(drugid: @test_mic['drug_id']).first
   @mic_isolate = Isolate.where(isolate_id: @test_mic['isolate_id']).first
   @mic_organism = Organism.where(code: @mic_isolate['organism_code']).first
 
   test = calc_breakpoint


### Move this into it's on method and then check reactions if surrogate_drugs
if test['surrogate_drugs'].present?
  puts test.inspect
    surrogate = test['surrogate_drugs'].split(",").to_a
      surrogate.each{|drugname|
        calc_breakpoint(drugname).inspect
        breakpoint = calc_breakpoint(drugname)
        reactiontest = calc_reaction(breakpoint)
         
        puts "#{drugname} is #{reactiontest}!!!" 
      }

      # need to check the Breakpoint for r_if_surrogate_is: "I,R,NS" on the primary breakpoint
      # and assign 

end
   
  reaction = calc_reaction(calc_breakpoint) if !calc_breakpoint['surrogate_drugs'].present?
  #reaction = 

  assert reaction == control['reaction']

  end

end
