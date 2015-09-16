

namespace :db do
  desc "Import Exchange Data from NASDAQ, NYSE, AMEX"
  task :import => [:environment] do
  	require_relative '../importer'
    csvs_dir = File.expand_path('../../..', __FILE__) + '/db/exchanges/*'
    csvs_files = Dir[csvs_dir]
    csvs_files.each do |file|
      ImportData.new(file).import
    end

  end
end