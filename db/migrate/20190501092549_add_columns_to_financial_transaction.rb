class AddColumnsToFinancialTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :financial_transactions, :source, :string
  end
end
