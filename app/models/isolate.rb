class Isolate < ActiveRecord::Base
belongs_to :isolate, primary_key: 'organism_code', foreign_key: 'code'
has_many :mic

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Isolate.create! row.to_hash
  end
end

end
