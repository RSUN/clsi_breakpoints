require 'csv'   

namespace :csv do
  desc "Import CSV file into any table."
  task import: :environment do 
  	  filename = ENV['FILENAME']
  	  import_to = ENV['MODEL'].constantize
     CSV.foreach(filename, :headers => true) do |row|
       import_to.create!(row.to_hash)
     end
  end

end