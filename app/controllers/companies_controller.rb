class CompaniesController < ApplicationController


	def index
		@companies = Company.first(20)
	end

	def start_search
	end

	def search
		@companies = SearchCompanies.new(params[:search_term]).search_companies
		render :'companies/index'
	end

	def show
		@company = Company.find_by(id: params[:id])
		yahoo_client = YahooFinance::Client.new
		data = yahoo_client.historical_quotes(@company.symbol)
	end
	
end