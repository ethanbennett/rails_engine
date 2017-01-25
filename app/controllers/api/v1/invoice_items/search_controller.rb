class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json: InvoiceItem.where(search_params)
  end

  def show
    render json: InvoiceItem.find_by(search_params)
  end

  private

  def search_params
    if params[:unit_price]
      params[:unit_price] = ((params["unit_price"].to_f) * 100.00).to_i
      invoice_items_params
    else
      invoice_items_params
    end
  end

  def invoice_items_params
    params.permit(:id, :item_id, :invoice_id, :unit_price, :quantity, :created_at, :updated_at)
  end
end
