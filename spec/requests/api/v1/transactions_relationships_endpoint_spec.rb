require 'rails_helper'

describe "merchant relationship endpoints" do

  context "get an invoice associated with a transaction" do
    it "returns a list of all invoice_items" do
     create_list(:merchant, 4)
     create(:customer)
     create(:invoice, merchant_id: Merchant.first.id, customer_id: Customer.first.id)
     create_list(:transaction, 5, invoice_id: Invoice.first.id )

      get "/api/v1/transactions/#{Transaction.first.id}/invoice"

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice["merchant_id"]).to eq(Merchant.first.id)
    end
  end
end
