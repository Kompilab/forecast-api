class FinancialTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates_presence_of :description, :amount, :transaction_type, :transaction_date, :user_id, :category_id, :source, :payment_method
  before_save :set_source

  PAYMENT_METHODS = %w(card card_pos card_web card_mobile cash)

  def set_source
    self.source = source || 'manual'
  end
end
