class BankStatement < ApplicationRecord
  has_many_attached :statements
end
