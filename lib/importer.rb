
require_relative "../app/models/company"

class ImportData


	attr_accessor :file

	def initialize(file)
		@file = file
	end



	def import
		counter = 0
	 	CSV.foreach(file, headers: true) do |row|
	 		row_hash = row.to_hash
	 		company = Company.new(symbol: row_hash["Symbol"], 
								  name: row_hash["Name"],
 								  market_cap: row_hash["MarketCap"], 
								  sector: row_hash["Sector"], 
								  industry: row_hash["industry"])
	 		company.save!
	 		counter += 1 if company.persisted? 
	    end

	    p "Imported #{counter} companies"
	end


end