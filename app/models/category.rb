class Category < ApplicationRecord
  belongs_to :parent_category
  has_many :financial_transactions
  validates_presence_of :name
end
