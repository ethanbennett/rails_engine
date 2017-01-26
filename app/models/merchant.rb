class Merchant < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
end
