class Api::V1::Merchants::TotalRevenueController < ApplicationController

  def show
    revenue_total = Merchant.total_revenue(params[:date])
    render json: revenue_total, :serializer => TotalRevenueSerializer
  end

end