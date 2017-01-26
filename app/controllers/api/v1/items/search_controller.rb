class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: Item.where(search_params)
  end

  def show
    render json: Item.find_by(search_params)
  end

  private

  def search_params
    if params[:unit_price]
      params[:unit_price] = ((params["unit_price"].to_f) * 100).round(0).to_i
      items_params
    else
      items_params
    end
end

  def items_params
    params.permit(:id, :name, :description, :item_id, :invoice_id, :unit_price, :merchant_id, :quantity, :created_at, :updated_at)
  end
end
