class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def index
  end

  def show
    revenue =  Merchant.total_revenue(params[:id])
    render json: revenue, serializer: MerchantRevenueSerializer, serializer_params: { amount: revenue }
  end

private

  def search_params
  end
end