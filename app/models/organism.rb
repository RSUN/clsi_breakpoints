class Organism < ActiveRecord::Base
has_many :isolates, primary_key: 'code', foreign_key: 'organism_code'

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Organism.create! row.to_hash
  end

end
end
