class Drug < ActiveRecord::Base
	has_many :mic

def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Drug.create! row.to_hash
  end
end
	

end
