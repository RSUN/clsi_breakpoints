class Mic < ActiveRecord::Base
  belongs_to :isolate
  belongs_to :drug , foreign_key: 'drug_id', primary_key: 'drugid'

 def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Mic.create! row.to_hash
  end
end


end
