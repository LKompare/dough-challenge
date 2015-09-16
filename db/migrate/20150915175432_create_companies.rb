class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.string :name
    	t.string :symbol
    	t.string :market_cap
    	t.string :sector
    	t.string :industry

    	t.timestamps
    end
  end
end
