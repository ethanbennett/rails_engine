class VerboseRevenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :revenue

  def revenue
    ((object.get_revenue(instance_options[:date]).to_i)/100.00).to_s
  end
end