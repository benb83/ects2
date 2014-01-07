class CreateFinancialCurrencies < ActiveRecord::Migration
  def change
    create_table :financial_currencies do |t|
      t.string :short_code, limit: 3
      t.string :description, limit: 35

      t.timestamps
    end
  end
end
