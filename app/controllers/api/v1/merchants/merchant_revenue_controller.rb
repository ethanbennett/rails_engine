class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  before_action :set_merchants

  def index
    limit = params[:quantity].to_i - 1
    render :json => @merchants[0..limit], :each_serializer => VerboseRevenueSerializer
  end

  def show
    merchant = Merchant.find(params[:id])
    render :json => merchant, :serializer => MerchantRevenueSerializer, :date => params[:date]
  end

private

  def search_params
    params.permit(:quantity, :id, :date)
  end

  def set_merchants
    @merchants = Merchant.all.order("revenue DESC")
  end
end