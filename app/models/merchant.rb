class Merchant < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def revenue(date=nil)
    if date
      self.invoices.where(created_at: date)
      .joins(:transactions, :invoice_items)
      .where(transactions: {result: "success"})
      .sum('invoice_items.unit_price * invoice_items.quantity')
    else
      self.invoices.joins(:transactions, :invoice_items)
      .where(transactions: {result: "success"})
      .sum('invoice_items.unit_price * invoice_items.quantity')
    end
  end

  def self.total_revenue(date)
    totals = Merchant.all.map { |merchant| merchant.revenue(date) }
    totals.reduce(:+)
  end
end
