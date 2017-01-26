class Merchant < ApplicationRecord
  has_many :invoices

  def self.total_revenue(id)
    merchant = Merchant.find(id)
    merchant.invoices.joins(:transactions, :invoice_items)
    .where(transactions: {result: "success"})
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end
end
