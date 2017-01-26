class Api::V1::Merchants::MerchantRevenueController < ApplicationController

  def index
  end

  def show
    @revenue =  Merchant.revenue(params[:id])
    render :json => @revenue, :serializer => MerchantRevenueSerializer, :revenue => @revenue
  end

private

  def search_params
  end
end