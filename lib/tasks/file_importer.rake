require 'smarter_csv'
require './config/environment'
require './app/models/customer'
require './app/models/invoice_item'
require './app/models/invoice'
require './app/models/item'
require './app/models/merchant'
require './app/models/transaction'

task :import_files => :environment do

  options = {:key_mapping => {:unwanted_row => nil, :old_row_name => :new_name}}

    SmarterCSV.process('lib/csv/customers.csv', options) do |array|
      Customer.create( array.first )
      puts "Created a customer"
    end

    SmarterCSV.process('lib/csv/merchants.csv', options) do |array|
      Merchant.create( array.first )
      puts "Created a merchant"
    end

    SmarterCSV.process('lib/csv/invoices.csv', options) do |array|
      Invoice.create( array.first )
      puts "Created an invoice"
    end

    SmarterCSV.process('lib/csv/items.csv', options) do |array|
      Item.create( array.first )
      puts "Created an item"
    end
    #
    SmarterCSV.process('lib/csv/invoice_items.csv', options) do |array|
      InvoiceItem.create( array.first )
      puts "Created an invoice item"
    end

    SmarterCSV.process('lib/csv/transactions.csv', options) do |array|
      Transaction.create!( array.first )
      puts "Created a transaction"
    end

    def calculate_revenues
      Merchant.record_timestamps = false
      Merchant.all.each do |merchant|
        merchant.update(revenue: merchant.get_revenue)
        puts "calculating merchant revenue"
      end
      Merchant.record_timestamps = true
    end
  calculate_revenues
end
