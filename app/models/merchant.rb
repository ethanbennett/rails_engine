class Merchant < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.revenue(id)
    merchant = Merchant.find(id)
    merchant.invoices.joins(:transactions, :invoice_items)
    .where(transactions: {result: "success"})
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def merchant_revenue_serializer
    MerchantRevenueSerializer
  end
end
