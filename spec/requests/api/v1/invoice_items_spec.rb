require 'rails_helper'

describe "Invoice Items API" do
  it "returns a list of invoice items" do
    create_list(:invoice_item, 3)
    get "/api/v1/invoice_items"
    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
  end

  it "returns a single invoice item" do
    invoice_item = create(:invoice_item)


    get "/api/v1/invoice_items/#{invoice_item.id}"

    invoice_item_info = [JSON.parse(response.body)]
    invoice_item_1  = invoice_item_info.first


    expect(response).to be_success
    expect(invoice_item_info.count).to eq(1)
    expect(invoice_item_1).to be_a(Hash)
    expect(invoice_item_1).to have_key("id")
    expect(invoice_item_1).to have_key("item_id")
    expect(invoice_item_1).to have_key("invoice_id")
    expect(invoice_item_1).to have_key("unit_price")
    expect(invoice_item_1).to have_key("quantity")
    expect(invoice_item_1["item_id"]).to be_a(Integer)
    expect(invoice_item_1["invoice_id"]).to be_a(Integer)
    expect(invoice_item_1["unit_price"]).to be_a(Integer)
    expect(invoice_item_1["quantity"]).to be_a(Integer)
    expect(invoice_item_1["id"]).to be_a(Integer)
  end

  context "returns a single invoice item" do
    it "returns a single invoice_item when given an id number" do
      invoice_item = create_list(:invoice_item, 3)


      get "/api/v1/invoice_items/find?#{invoice_item.first.id}"

      invoice_item_info = [JSON.parse(response.body)]
      invoice_item_1  = invoice_item_info.first

      expect(response).to be_success
      expect(invoice_item_info.count).to eq(1)
      expect(invoice_item_1).to be_a(Hash)
      expect(invoice_item_1).to have_key("id")
      expect(invoice_item_1).to have_key("item_id")
      expect(invoice_item_1).to have_key("invoice_id")
      expect(invoice_item_1).to have_key("unit_price")
      expect(invoice_item_1).to have_key("quantity")
      expect(invoice_item_1["item_id"]).to be_a(Integer)
      expect(invoice_item_1["invoice_id"]).to be_a(Integer)
      expect(invoice_item_1["unit_price"]).to be_a(Integer)
      expect(invoice_item_1["quantity"]).to be_a(Integer)
      expect(invoice_item_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice item when given a created_at" do
      invoice_item = create_list(:invoice_item, 3)


      get "/api/v1/invoice_items/find?#{invoice_item.first.created_at}"

      invoice_item_info = [JSON.parse(response.body)]
      invoice_item_1  = invoice_item_info.first


      expect(response).to be_success
      expect(invoice_item_info.count).to eq(1)
      expect(invoice_item_1).to be_a(Hash)
      expect(invoice_item_1).to have_key("id")
      expect(invoice_item_1).to have_key("item_id")
      expect(invoice_item_1).to have_key("invoice_id")
      expect(invoice_item_1).to have_key("unit_price")
      expect(invoice_item_1).to have_key("quantity")
      expect(invoice_item_1["item_id"]).to be_a(Integer)
      expect(invoice_item_1["invoice_id"]).to be_a(Integer)
      expect(invoice_item_1["unit_price"]).to be_a(Integer)
      expect(invoice_item_1["quantity"]).to be_a(Integer)
      expect(invoice_item_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice item when given a updated_at" do
      invoice_item = create_list(:invoice_item, 3)


      get "/api/v1/invoice_items/find?#{invoice_item.first.updated_at}"

      invoice_item_info = [JSON.parse(response.body)]
      invoice_item_1  = invoice_item_info.first


      expect(response).to be_success
      expect(invoice_item_info.count).to eq(1)
      expect(invoice_item_1).to be_a(Hash)
      expect(invoice_item_1).to have_key("id")
      expect(invoice_item_1).to have_key("item_id")
      expect(invoice_item_1).to have_key("invoice_id")
      expect(invoice_item_1).to have_key("unit_price")
      expect(invoice_item_1).to have_key("quantity")
      expect(invoice_item_1["item_id"]).to be_a(Integer)
      expect(invoice_item_1["invoice_id"]).to be_a(Integer)
      expect(invoice_item_1["unit_price"]).to be_a(Integer)
      expect(invoice_item_1["quantity"]).to be_a(Integer)
      expect(invoice_item_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice item when given a item id" do
      invoice_item = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find?#{invoice_item.first.item_id}"

      invoice_item_info = [JSON.parse(response.body)]
      invoice_item_1  = invoice_item_info.first


      expect(response).to be_success
      expect(invoice_item_info.count).to eq(1)
      expect(invoice_item_1).to be_a(Hash)
      expect(invoice_item_1).to have_key("id")
      expect(invoice_item_1).to have_key("item_id")
      expect(invoice_item_1).to have_key("invoice_id")
      expect(invoice_item_1).to have_key("unit_price")
      expect(invoice_item_1).to have_key("quantity")
      expect(invoice_item_1["item_id"]).to be_a(Integer)
      expect(invoice_item_1["invoice_id"]).to be_a(Integer)
      expect(invoice_item_1["unit_price"]).to be_a(Integer)
      expect(invoice_item_1["quantity"]).to be_a(Integer)
      expect(invoice_item_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice item when given a quantity" do
      invoice_item = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find?#{invoice_item.first.quantity}"

      invoice_item_info = [JSON.parse(response.body)]
      invoice_item_1  = invoice_item_info.first


      expect(response).to be_success
      expect(invoice_item_info.count).to eq(1)
      expect(invoice_item_1).to be_a(Hash)
      expect(invoice_item_1).to have_key("id")
      expect(invoice_item_1).to have_key("item_id")
      expect(invoice_item_1).to have_key("invoice_id")
      expect(invoice_item_1).to have_key("unit_price")
      expect(invoice_item_1).to have_key("quantity")
      expect(invoice_item_1["item_id"]).to be_a(Integer)
      expect(invoice_item_1["invoice_id"]).to be_a(Integer)
      expect(invoice_item_1["unit_price"]).to be_a(Integer)
      expect(invoice_item_1["quantity"]).to be_a(Integer)
      expect(invoice_item_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice item when given a unit_price" do
      invoice_item = create_list(:invoice_item, 3)

      get "/api/v1/invoice_items/find?#{invoice_item.first.unit_price}"

      invoice_item_info = [JSON.parse(response.body)]
      invoice_item_1  = invoice_item_info.first


      expect(response).to be_success
      expect(invoice_item_info.count).to eq(1)
      expect(invoice_item_1).to be_a(Hash)
      expect(invoice_item_1).to have_key("id")
      expect(invoice_item_1).to have_key("item_id")
      expect(invoice_item_1).to have_key("invoice_id")
      expect(invoice_item_1).to have_key("unit_price")
      expect(invoice_item_1).to have_key("quantity")
      expect(invoice_item_1["item_id"]).to be_a(Integer)
      expect(invoice_item_1["invoice_id"]).to be_a(Integer)
      expect(invoice_item_1["unit_price"]).to be_a(Integer)
      expect(invoice_item_1["quantity"]).to be_a(Integer)
      expect(invoice_item_1["id"]).to be_a(Integer)
    end
  end
end
