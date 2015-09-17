
class SearchCompanies

	attr_accessor :search_term

	def initialize(search_term)
		@search_term = search_term
	end


	def perform_symbol_search(search_term)
		Company.where("LOWER(symbol) LIKE ?", "#{search_term.downcase}%")
	end


	def perform_company_name_search(search_term)
	    Company.where("LOWER(name) LIKE ?", "#{search_term.downcase}%")
	end

	def search_companies
	    names = perform_company_name_search(search_term)
	    symbols = perform_symbol_search(search_term)
	    names.concat(symbols).uniq.sort { |a, b| a.name <=> b.name }.first(20)
	end


end