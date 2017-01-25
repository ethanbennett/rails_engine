require 'rails_helper'

describe "items relationship endpoints" do
  before(:all) do
    create(:merchant)
  end

  context "get invoice items through items" do
    it "returns a list of all invoice_items" do
      create_list(:item, 3, merchant_id: Merchant.first.id)
      create_list(:invoice_item, 3, item_id: Item.first.id)

      get "/api/v1/items/#{Item.first.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first["id"]).to eq(InvoiceItem.first.id)
    end
  end

  context "get merchants through items" do
    it "returns a list of all invoice_items" do
      create_list(:item, 3, merchant_id: Merchant.first.id)

      get "/api/v1/items/#{Item.first.id}/merchant"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items["id"]).to eq(Merchant.first.id.to_i)
    end
  end
end
