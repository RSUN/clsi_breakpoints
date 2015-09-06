require 'csv'   

namespace :csv do
  desc "Import CSV file into any table. Use FILENAME and MODEL as args."
  task import: :environment do 
  	  filename = ENV['FILENAME']
  	  import_to = ENV['MODEL'].constantize
      STDOUT.puts "Are you sure you want to destroy everything in #{import_to} and replace it with the csv?"
      STDOUT.print "Y/n"
      answer = STDIN.gets.chomp
      exit if answer.downcase != "y"
       import_to.destroy_all 
      CSV.foreach(filename, :headers => true) do |row|
       import_to.create!(row.to_hash)
     end
  end

end
