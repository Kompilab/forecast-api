class CreateFinancialTransaction < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_transactions do |t|
      t.references :user
      t.references :category

      t.string :item
      t.text :details
      t.float :amount
      t.string :transaction_type
      t.date :transaction_date
      t.string :source
      t.string :payment_method # use ActiveRecord::Enum later for this (https://naturaily.com/blog/ruby-on-rails-enum)
      t.boolean :deleted, default: false, null: false

      t.timestamps
    end
  end
end
