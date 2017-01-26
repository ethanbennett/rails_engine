class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def best_day
    self.invoices.joins(:transactions, :invoice_items)
       .where(transactions: {result: "success"})
       .select("invoices.created_at")
       .group(:created_at).order("sum(invoice_items.quantity) DESC")
       .first.created_at
  end

  def self.most_items(quantity)
    joins(invoices: [:transactions])
        .merge(Transaction.where(result: "success"))
        .group(:id).order("sum(invoice_items.quantity) DESC").first(quantity)
  end
end
