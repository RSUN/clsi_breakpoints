require 'test_helper'

class TestreactionTest < ActiveSupport::TestCase


  test "Reaction one based on existing data" do
   control = Testreaction.first  
   find_reaction(control)

     
  end

  test "Reaction two based on existing data" do
    control = Testreaction.second
    find_reaction(control) 
     
  end

  test "Reaction three based on existing data" do
     control = Testreaction.third
     find_reaction(control)     
  end

  test "Reaction four based on existing data" do
     control = Testreaction.fourth
     find_reaction(control)     
  end

  test "Reaction five based on existing data" do
     control = Testreaction.fifth
     find_reaction(control)     
  end


end
