require 'rails_helper'

describe "merchant relationship endpoints" do

  context "get items associated with a merchant" do
    it "returns a list of all invoice_items" do
      create_list(:merchant, 2)
      create_list(:item, 5, merchant_id: Merchant.first.id)

      get "/api/v1/merchants/#{Merchant.first.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(6)
    end
  end

  context "get invoices associated with a merchant" do
    it "returns a list of all invoice_items" do
      create_list(:merchant, 2)
      create(:customer)
      create_list(:invoice, 5, merchant_id: Merchant.first.id, customer_id: Customer.first.id)

      get "/api/v1/merchants/#{Merchant.first.id}/invoices"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(5)
    end
  end
end
