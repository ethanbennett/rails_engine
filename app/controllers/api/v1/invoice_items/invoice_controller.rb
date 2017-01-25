class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def index
    render json: Invoice.find(params[:id])
  end
end
