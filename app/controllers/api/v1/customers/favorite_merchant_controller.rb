class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def index
    
    render json: Customer.find(params[:id])
                        .merchants.joins(:transactions)
                        .merge(Transaction.where(result: "success"))
                        .group(:id, :name)
                        .order("count(merchants.id) DESC").first
  end
end
