class Merchant < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

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

  # def sort(merchants)
  #   merchants = []
  #   Merchant.all.each do |merchant|
  #     merchants << [merchant, merchant.revenue]
  #   end
  #   merchants = merchants.sort_by { |merchant, revenue| revenue }
  #   merchants.reverse
  #   binding.pry
  # end

  def merchant_index_serializer
    MerchantIndexSerializer
  end

  def merchant_revenue_serializer
    MerchantRevenueSerializer
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
