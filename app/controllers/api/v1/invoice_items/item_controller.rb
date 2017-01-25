class Api::V1::InvoiceItems::ItemController < ApplicationController

  def index
    render json: InvoiceItem.find(params[:id].to_i).item
  end
end
