class Breakpoint < ActiveRecord::Base

  def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Breakpoint.create! row.to_hash
  end
end

end
