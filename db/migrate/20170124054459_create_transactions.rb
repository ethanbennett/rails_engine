class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :credit_card_number, :limit => 8
      t.string   :result
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
