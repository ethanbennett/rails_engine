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

  def self.revenue_totals
    merchants = {}
    Merchant.all.each do |merchant|
      merchants[merchant] = merchant.revenue
    end
    merchants = merchants.sort_by { |merchant, revenue| revenue }
    merchants.reverse
  end


  def merchant_revenue_serializer
    MerchantRevenueSerializer
  end
end
