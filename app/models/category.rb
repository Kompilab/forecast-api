class Category < ApplicationRecord
  belongs_to :parent_category
  has_many :financial_transactions
  validates_presence_of :name

  def self.by_name(name)
    where('lower(name) = ?', name.downcase).first
  end
end
