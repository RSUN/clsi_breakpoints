class Isolate < ActiveRecord::Base
belongs_to :organism, primary_key: 'code', foreign_key: 'organism_code'
has_many :mic

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Isolate.create! row.to_hash
  end
end

end
