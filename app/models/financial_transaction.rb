class FinancialTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates_presence_of :item, :details, :amount, :transaction_type, :transaction_date, :user_id, :category_id
end
