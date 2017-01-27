class Merchant < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  scope :date?, lambda { |date|
    return nil unless date.present?
    where(invoices: {created_at: date})
  }

  def get_revenue(date=nil)

    self.invoices.merge(Merchant.date?(date))
    .joins(:transactions, :invoice_items)
    .where(transactions: {result: "success"})
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def self.total_revenue(date)
    totals = Merchant.all.map { |merchant| merchant.get_revenue(date) }
    totals.reduce(:+)
  end

  def favorite_customer
    self.customers.joins(:transactions)
    .merge(Transaction.where(result: "success"))
    .group(:id, :first_name, :last_name)
    .order("count(customers.id) DESC").first
  end

  def customers_with_pending_invoices
    self.customers.joins(:invoices)
        .select(Invoice.where(status: "pending")).uniq
  end
end
