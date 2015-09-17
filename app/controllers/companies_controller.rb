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
		raw_data = yahoo_client.historical_quotes(@company.symbol, { start_date: Time::now-(24*60*60*30), end_date: Time::now })
		@average_price = raw_data.map do |day|
											[day.low.to_f, 
											 day.high.to_f, 
											 day.open.to_f, 
											 day.close.to_f].reduce(:+)/4.0
		end
	end
	
end