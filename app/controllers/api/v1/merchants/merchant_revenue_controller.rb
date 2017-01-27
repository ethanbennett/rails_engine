class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  before_action :set_merchants

  def index
    limit = params[:quantity].to_i - 1
    render :json => @merchants[0..limit], :each_serializer => MerchantRevenueSerializer
  end

  def show
    merchant = Merchant.find(search_params)
    @revenue = merchant.get_revenue(search_params)
    render :json => @revenue, :serializer => MerchantRevenueSerializer, :revenue => @revenue
  end

private

  def search_params
    params.permit(:quantity, :id, :date)
  end

  def set_merchants
    @merchants = Merchant.all.order("revenue DESC")
  end
end