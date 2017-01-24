class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :customer
      t.references :merchant, foreign_key: true
      t.text :status

      t.timestamps
    end
  end
end
