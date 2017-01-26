class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  before_action :set_merchants

  def index
    # binding.pry
    limit = params[:quantity].to_i - 1
    render :json => @merchants[0..limit], :each_serializer => MerchantRevenueSerializer
  end

  def show
    merchant = Merchant.find(params[:id])
    @revenue = merchant.revenue(params["date"])
    render :json => @revenue, :serializer => MerchantRevenueSerializer, :revenue => @revenue
  end

private

  def search_params
  end



  def set_merchants
    @merchants = Merchant.all.order("revenue DESC")
  end
end