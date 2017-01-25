class Api::V1::Items::MerchantController < ApplicationController

  def index
    render json: Item.find(params[:id].to_i).merchant
  end
end
