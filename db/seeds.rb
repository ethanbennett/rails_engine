require 'smarter_csv'

options = {:key_mapping => {:unwanted_row => nil, :old_row_name => :new_name}}

SmarterCSV.process('db/csv/customers.csv', options) do |array|
  Customer.create( array.first )
end

SmarterCSV.process('db/csv/merchants.csv', options) do |array|
  Merchant.create( array.first )
end

SmarterCSV.process('db/csv/invoices.csv', options) do |array|
  Invoice.create( array.first )
end

SmarterCSV.process('db/csv/items.csv', options) do |array|
  Item.create( array.first )
end

SmarterCSV.process('db/csv/invoice_items.csv', options) do |array|
  InvoiceItem.create( array.first )
end

SmarterCSV.process('db/csv/transactions.csv', options) do |array|
  Transaction.create!( array.first )
  puts "Created a transaction"
end

