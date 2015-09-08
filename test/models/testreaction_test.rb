require 'test_helper'

class TestreactionTest < ActiveSupport::TestCase

offset = rand(Testreaction.count - 4)

  test "Reaction one based on existing data" do
   control = Testreaction.first  
   reaction = Testreaction.find_reaction(control) 
   assert reaction == control['reaction']   
  end

  test "Reaction two based on existing data" do
  control = Testreaction.second
   reaction = Testreaction.find_reaction(control) 
   assert reaction == control['reaction']  
  end

  test "Reaction three based on existing data" do
   control = Testreaction.third
   reaction = Testreaction.find_reaction(control) 
   assert reaction == control['reaction']  
  end

  test "Reaction four based on existing data" do
   control = Testreaction.fourth
   reaction = Testreaction.find_reaction(control) 
   assert reaction == control['reaction']  
  end

  test "Reaction five based on existing data" do
   control = Testreaction.fifth
   reaction = Testreaction.find_reaction(control) 
   assert reaction == control['reaction']    
  end

  # test "Reaction random1 based on existing data" do
  #  control = Testreaction.offset(offset).first
  #  reaction = Testreaction.find_reaction(control)    
  #  if reaction != control['reaction'] 
  #   puts "Reaction should be #{control['reaction']}"
  #   puts "I am getting #{reaction}"
  #   puts control.inspect 
  # end
  #  assert reaction == control['reaction']    
  # end

  #   test "Reaction random2 based on existing data" do
  #  control = Testreaction.offset(offset).second
  #  reaction = Testreaction.find_reaction(control)    
  #  if reaction != control['reaction'] 
  #   puts "Reaction should be #{control['reaction']}"
  #   puts "I am getting #{reaction}"
  #   puts control.inspect 
  # end
  #  assert reaction == control['reaction']    
  # end

  #   test "Reaction random3 based on existing data" do
  #  control = Testreaction.offset(offset).third
  #  reaction = Testreaction.find_reaction(control)    
  #  if reaction != control['reaction'] 
  #   puts "Reaction should be #{control['reaction']}"
  #   puts "I am getting #{reaction}"
  #   puts control.inspect 
  # end
  #  assert reaction == control['reaction']    
  # end

  # test "Reaction last based on existing data" do
  #  control = Testreaction.last 
  #  reaction = Testreaction.find_reaction(control) 
  # if reaction != control['reaction'] 
  #   puts "Reaction should be #{control['reaction']}"
  #   puts "I am getting #{reaction}"
  #   puts control.inspect 
  # end
  #  assert reaction == control['reaction']    
  # end

  (50...300).to_a.each { | i |
    test "Testing #{ i }" do
      control = Testreaction.offset(i).first
      reaction = Testreaction.find_reaction( control )
      if reaction != control['reaction']
        puts "Reaction should be #{control['reaction']} but got #{reaction}\n"
        puts control.inspect + "\n"
      end
      assert reaction == control[ 'reaction' ]
    end

  }



end
