require 'rails_helper'

describe "Items API" do
  it "returns a list of items" do
    create_list(:item, 3)
    get "/api/v1/items"
    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(6)
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("unit_price")
    expect(item).to have_key("merchant_id")
  end

  it "returns a single item" do
    item = create(:item)


    get "/api/v1/items/#{item.id}"

    item_info = [JSON.parse(response.body)]
    item_1  = item_info.first


    expect(response).to be_success
    expect(item_info.count).to eq(1)
    expect(item_1).to be_a(Hash)
    expect(item_1).to have_key("id")
    expect(item_1).to have_key("name")
    expect(item_1).to have_key("description")
    expect(item_1).to have_key("unit_price")
    expect(item_1).to have_key("merchant_id")
    expect(item_1["description"]).to be_a(String)
    expect(item_1["unit_price"]).to be_a(String)
    expect(item_1["name"]).to be_a(String)
    expect(item_1["id"]).to be_a(Integer)
  end

  context "returns a single item" do
    it "returns a single item when given an id number" do
      item = create_list(:item, 3)


      get "/api/v1/items/find?#{item.first.id}"

      item_info = [JSON.parse(response.body)]
      item_1  = item_info.first

      expect(response).to be_success
      expect(item_info.count).to eq(1)
      expect(item_1).to be_a(Hash)
      expect(item_1).to have_key("id")
      expect(item_1).to have_key("name")
      expect(item_1).to have_key("description")
      expect(item_1).to have_key("unit_price")
      expect(item_1).to have_key("merchant_id")
      expect(item_1["description"]).to be_a(String)
      expect(item_1["unit_price"]).to be_a(String)
      expect(item_1["name"]).to be_a(String)
      expect(item_1["id"]).to be_a(Integer)
    end

    it "returns a single item when given a created_at" do
      item = create_list(:item, 3)


      get "/api/v1/items/find?#{item.first.created_at}"

      item_info = [JSON.parse(response.body)]
      item_1  = item_info.first


      expect(response).to be_success
      expect(item_info.count).to eq(1)
      expect(item_1).to be_a(Hash)
      expect(item_1).to have_key("id")
      expect(item_1).to have_key("name")
      expect(item_1).to have_key("description")
      expect(item_1).to have_key("unit_price")
      expect(item_1).to have_key("merchant_id")
      expect(item_1["description"]).to be_a(String)
      expect(item_1["unit_price"]).to be_a(String)
      expect(item_1["name"]).to be_a(String)
      expect(item_1["id"]).to be_a(Integer)
    end

    it "returns a single item when given a updated_at" do
      item = create_list(:item, 3)


      get "/api/v1/items/find?#{item.first.updated_at}"

      item_info = [JSON.parse(response.body)]
      item_1  = item_info.first


      expect(response).to be_success
      expect(item_info.count).to eq(1)
      expect(item_1).to be_a(Hash)
      expect(item_1).to have_key("id")
      expect(item_1).to have_key("name")
      expect(item_1).to have_key("description")
      expect(item_1).to have_key("unit_price")
      expect(item_1).to have_key("merchant_id")
      expect(item_1["description"]).to be_a(String)
      expect(item_1["unit_price"]).to be_a(String)
      expect(item_1["name"]).to be_a(String)
      expect(item_1["id"]).to be_a(Integer)
    end

    it "returns a single item when given a name" do
      item = create_list(:item, 3)

      get "/api/v1/items/find?#{item.first.name}"

      item_info = [JSON.parse(response.body)]
      item_1  = item_info.first


      expect(response).to be_success
      expect(item_info.count).to eq(1)
      expect(item_1).to be_a(Hash)
      expect(item_1).to have_key("id")
      expect(item_1).to have_key("name")
      expect(item_1).to have_key("description")
      expect(item_1).to have_key("unit_price")
      expect(item_1).to have_key("merchant_id")
      expect(item_1["description"]).to be_a(String)
      expect(item_1["unit_price"]).to be_a(String)
      expect(item_1["name"]).to be_a(String)
      expect(item_1["id"]).to be_a(Integer)
    end

    it "returns a single item when given a description" do
      item = create_list(:item, 3)

      get "/api/v1/items/find?#{item.first.description}"

      item_info = [JSON.parse(response.body)]
      item_1  = item_info.first


      expect(response).to be_success
      expect(item_info.count).to eq(1)
      expect(item_1).to be_a(Hash)
      expect(item_1).to have_key("id")
      expect(item_1).to have_key("name")
      expect(item_1).to have_key("description")
      expect(item_1).to have_key("unit_price")
      expect(item_1).to have_key("merchant_id")
      expect(item_1["description"]).to be_a(String)
      expect(item_1["unit_price"]).to be_a(String)
      expect(item_1["name"]).to be_a(String)
      expect(item_1["id"]).to be_a(Integer)
    end

    it "returns a single item when given a unit_price" do
      item = create_list(:item, 3)

      get "/api/v1/items/find?#{item.first.unit_price}"

      item_info = [JSON.parse(response.body)]
      item_1  = item_info.first


      expect(response).to be_success
      expect(item_info.count).to eq(1)
      expect(item_1).to be_a(Hash)
      expect(item_1).to have_key("id")
      expect(item_1).to have_key("name")
      expect(item_1).to have_key("description")
      expect(item_1).to have_key("unit_price")
      expect(item_1).to have_key("merchant_id")
      expect(item_1["description"]).to be_a(String)
      expect(item_1["unit_price"]).to be_a(String)
      expect(item_1["name"]).to be_a(String)
      expect(item_1["id"]).to be_a(Integer)
    end

    it "returns a single item when given a merchant_id" do
      item = create_list(:item, 3)

      get "/api/v1/items/find?#{item.first.merchant_id}"

      item_info = [JSON.parse(response.body)]
      item_1  = item_info.first


      expect(response).to be_success
      expect(item_info.count).to eq(1)
      expect(item_1).to be_a(Hash)
      expect(item_1).to have_key("id")
      expect(item_1).to have_key("name")
      expect(item_1).to have_key("description")
      expect(item_1).to have_key("unit_price")
      expect(item_1).to have_key("merchant_id")
      expect(item_1["description"]).to be_a(String)
      expect(item_1["unit_price"]).to be_a(String)
      expect(item_1["name"]).to be_a(String)
      expect(item_1["id"]).to be_a(Integer)
    end
  end

  context "get items by revenue" do
    it "returns items by revenue" do
      create_list(:item, 4)
      create_list(:invoice, 4)
      create(:transaction, result: 'success', invoice_id: Invoice.first.id)
      create(:transaction, result: 'success', invoice_id: Invoice.last.id)
      create(:invoice_item, invoice_id: Invoice.first.id, item_id: Item.first.id, quantity: 15, unit_price: 5)
      create(:invoice_item, invoice_id: Invoice.second.id, item_id: Item.first.id, quantity: 15, unit_price: 5)
      create(:invoice_item, invoice_id: Invoice.last.id, item_id: Item.last.id, quantity: 12, unit_price: 2)

      get '/api/v1/items/most_revenue?quantity=2'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(2)
    end
  end

  context "get the most items sold" do
    it "returns the most items" do
      create_list(:item, 4)
      create_list(:invoice, 4)
      create(:transaction, result: 'success', invoice_id: Invoice.first.id)
      create(:transaction, result: 'success', invoice_id: Invoice.last.id)
      create(:invoice_item, invoice_id: Invoice.first.id, item_id: Item.first.id, quantity: 15, unit_price: 5)
      create(:invoice_item, invoice_id: Invoice.second.id, item_id: Item.first.id, quantity: 15, unit_price: 5)
      create(:invoice_item, invoice_id: Invoice.last.id, item_id: Item.last.id, quantity: 12, unit_price: 2)

      get '/api/v1/items/most_items?quantity=2'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(2)
    end
  end
end
