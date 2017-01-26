require 'rails_helper'

describe "invoice rlationship endpoints" do

  context "get the invoices associated with a customer" do
    it "returns the invoices associated with a customer" do
      create_list(:merchant, 3)
      create(:customer)
      create_list(:invoice, 4, merchant_id: Merchant.first.id, customer_id: Customer.first.id)

      get "/api/v1/customers/#{Customer.first.id}/invoices"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(5)
    end
  end

  context "get the transactions associated with a customer" do
    it "returns the transactions associated with a customer" do
      create(:merchant)
      create(:customer)
      create_list(:invoice, 3, merchant_id: Merchant.first.id, customer_id: Customer.first.id)
      create_list(:transaction, 5, invoice_id: Invoice.first.id)


      get "/api/v1/customers/#{Customer.first.id}/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(5)
    end
  end

  context "get a customer's favorite merchant" do
    xit "returns a customer's favorite merchant" do
      create_list(:merchant, 3)
      create_list(:customer, 2)
      create_list(:invoice, 2, customer_id: Customer.first.id, merchant_id: Merchant.first.id)
      create_list(:transaction, 3, invoice_id: Invoice.first.id)
      create(:invoice, customer_id: Customer.first.id, merchant_id: Merchant.last.id)

      get "/api/v1/customers/#{Customer.first.id}/favorite_merchant"
      
      favorite_merchant = JSON.parse(response.body)
      expect(response).to be_success
      expect(favorite_merchant["id"]).to eq(Merchant.second["id"])
    end
  end
end
