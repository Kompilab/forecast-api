class LendBorrow < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  scope :pending, -> { where status: 'pending' }
  scope :lent, -> { pending.where lb_type: 'lent' }
  scope :borrowed, -> { pending.where lb_type: 'borrowed' }
end
