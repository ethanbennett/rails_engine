class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue, :id, :name

  def revenue
    ((object[:revenue].to_i)/100.00).to_s
  end
end