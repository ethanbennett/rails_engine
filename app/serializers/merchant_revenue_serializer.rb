class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    ((serializer_params[:amount].to_i)/100.00).to_s
  end
end