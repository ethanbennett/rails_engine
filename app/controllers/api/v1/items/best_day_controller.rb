class Api::V1::Items::BestDayController < ApplicationController

  def index
    render json: Item.find(params[:id])
                     .invoices.joins(:transactions, :invoice_items)
                     .where(transactions: {result: "success"})
                     .select("invoices.created_at")
                     .group(:created_at).order("sum(invoice_items.quantity) DESC")
                     .first.created_at
  end
end
