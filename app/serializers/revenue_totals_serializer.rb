class RevenueTotalsSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_revenue

  def total_revenue
    binding.pry
    object.revenue
  end
end