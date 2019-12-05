class LendBorrow < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  scope :lent, -> { where lb_type: 'lent' }
  scope :borrowed, -> { where lb_type: 'borrowed' }
end
