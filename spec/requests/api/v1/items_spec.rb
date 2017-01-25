require 'rails_helper'

describe "Items API" do
  it "returns a list of items" do
    create_list(:item, 3)
    get "/api/v1/items"
    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
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
end
