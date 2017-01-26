class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def index
  end

  def show
    merchant = Merchant.find(params[:id])
    @revenue = merchant.revenue(params["date"])
    render :json => @revenue, :serializer => MerchantRevenueSerializer, :revenue => @revenue
  end

private

  def search_params
  end
end