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



end
