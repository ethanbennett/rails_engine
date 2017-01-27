class Api::V1::Merchants::RandomController < ApplicationController

  def show
    random_id = rand(Merchant.count)
    random_merchant = Merchant.find(random_id)
    render :json => random_merchant, :serializer => MerchantSerializer
  end

end