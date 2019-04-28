class Category < ApplicationRecord
  has_many :financial_transactions
  validates_presence_of :name, :category_type
end
