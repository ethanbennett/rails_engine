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
        .merge(Transaction.successful)
        .group(:id, :first_name, :last_name)
        .order("count(customers.id) DESC").first
  end

  def customers_with_pending_invoices
    Customer.find_by_sql("SELECT customers.* FROM customers
                          JOIN invoices ON invoices.customer_id = customers.id
                          WHERE invoices.merchant_id = #{self.id}
                          EXCEPT
                          SELECT customers.* FROM customers
                          JOIN invoices ON invoices.customer_id = customers.id
                          JOIN transactions ON transactions.invoice_id = invoices.id
                          WHERE invoices.merchant_id=#{self.id} AND transactions.result ='success'")
  end

  def self.most_items(quantity)
    Merchant.all.joins(invoices: [:transactions, :invoice_items])
                .merge(Transaction.successful)
                .group(:id).order("sum(invoice_items.quantity) DESC").first(quantity)
  end
end
