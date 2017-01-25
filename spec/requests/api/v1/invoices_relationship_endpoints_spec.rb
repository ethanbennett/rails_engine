require 'rails_helper'

describe "invoice rlationship endpoints" do
  before(:all) do
    create_list(:customer, 3)
    create_list(:merchant, 3)
  end

  context "get transactions associated with an invoice" do
    it "returns a list of transactions associated transactions" do
      create_list(:invoice, 3)
      create_list(:transaction, 5, invoice_id: Invoice.first.id)


      get "/api/v1/invoices/#{Invoice.first.id}/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(5)
    end
  end

  context "get invoice items associated with an invoice" do
    it "returns a list of invoice items associated transactions" do
      create_list(:invoice, 3)
      create_list(:transaction, 5, invoice_id: Invoice.first.id)
      create_list(:invoice_item, 5, invoice_id: Invoice.first.id)


      get "/api/v1/invoices/#{Invoice.first.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(5)
    end
  end

  context "get items associated with an invoice" do
    it "returns a list of items associated transactions" do
      create_list(:invoice, 3, merchant_id: Merchant.first.id )
      create_list(:item, 3)
      create_list(:invoice_item, 3, invoice_id: Invoice.first.id, item_id: Item.first.id)



      get "/api/v1/invoices/#{Invoice.first.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
      expect(Invoice.first.merchant.id).to eq(Merchant.first.id)
    end
  end

  context "get customer associated with an invoice" do
    it "returns the customer associated transactions" do
      create_list(:invoice, 3, customer_id: Customer.first.id )



      get "/api/v1/invoices/#{Invoice.first.id}/customer"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["first_name"]).to eq(Customer.first.first_name)
    end
  end

  context "get merchant associated with an invoice" do
    it "returns the merchant associated transactions" do
      create_list(:invoice, 3, merchant_id: Merchant.first.id )



      get "/api/v1/invoices/#{Invoice.first.id}/merchant"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["name"]).to eq(Merchant.first.name)
    end
  end


end
