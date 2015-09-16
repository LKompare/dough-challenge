require 'csv'
require_relative "../app/models/company"

class ImportData


	attr_accessor :file, :unquoted

	def initialize(file)
		@file = file
		@unquoted = unquoted
	end


	
	def remove_quotes
		quoted = File.read(@file)
		@unquoted = quoted.gsub("\"", "")
		return @unquoted
	end


	def import
	  	# remove_quotes
	  	# p "removed quotes!"
	  	quoted = File.read(@file)
		@unquoted = quoted.gsub("\"", "")
		counter = 0
	 	CSV.parse(@unquoted, headers: true) do |row|
	 		row_hash = row.to_hash
	 		company = Company.new(symbol: row_hash["Symbol"], 
								  name: row_hash["Name"],
 								  market_cap: row_hash["MarketCap"], 
								  sector: row_hash["Sector"], 
								  industry: row_hash["Industry"])
	 		company.save!
	 		p compan
	 		counter += 1 if company.persisted? 
	    end

	    p "Imported #{counter} companies"
	end


end