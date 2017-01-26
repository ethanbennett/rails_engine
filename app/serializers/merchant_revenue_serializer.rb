class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    ((@instance_options[:revenue].to_i)/100.00).to_s
  end
end