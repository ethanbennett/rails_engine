require 'rails_helper'

describe "invoice rlationship endpoints" do
  before(:all) do
    create_list(:item, 3)
    create_list(:invoice, 3)
  end

  context "get the item associated with an invoice item" do
    it "returns the item associated with the invoice item" do
      create_list(:invoice_item, 5, item_id: Item.first.id)

      byebug
      get "/api/v1/invoice_items/#{Invoice.first.id}/item"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first.id).to eq(InvoiceItem.first.id)
    end
  end

  context "get the item associated with an invoice item" do
    it "returns the item associated with the invoice item" do
      create_list(:invoice_item, 5, invoice_id: Invoice.first.id)


      get "/api/v1/invoice_items/#{Invoice.first.id}/invoice"

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices["id"]).to eq(Invoice.first.id)
    end
  end
end
