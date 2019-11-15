class Contact < ApplicationRecord
  belongs_to :user
  has_many :lend_borrows
end
