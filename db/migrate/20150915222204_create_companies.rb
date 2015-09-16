class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :symbol
      t.string :name
      t.string :market_cap
      t.string :sector
      t.string :industry


      t.timestamps null: false
    end
  end
end
