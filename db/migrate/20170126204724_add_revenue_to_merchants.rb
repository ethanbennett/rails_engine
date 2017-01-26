class AddRevenueToMerchants < ActiveRecord::Migration[5.0]
  def change
    add_column :merchants, :revenue, :integer
  end
end
