require 'rails_helper'

describe "Merchants API" do
  it "returns a list of merchants" do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

    merchants = JSON.parse(response.body)
    merchant  = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(3)
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant["name"]).to be_a(String)
    expect(merchant["id"]).to be_a(Integer)
  end

  it "returns a single merchant" do
    merchant = create(:merchant)


    get "/api/v1/merchants/#{merchant.id}"

    merchant_info = [JSON.parse(response.body)]
    merchant_1  = merchant_info.first


    expect(response).to be_success
    expect(merchant_info.count).to eq(1)
    expect(merchant_1).to be_a(Hash)
    expect(merchant_1).to have_key("id")
    expect(merchant_1).to have_key("name")
    expect(merchant_1["name"]).to be_a(String)
    expect(merchant_1["id"]).to be_a(Integer)
  end

  context "returns a single merchant" do
    it "returns a single merchant when given an id number" do
      merchant = create_list(:merchant, 3)


      get "/api/v1/merchants/find?#{merchant.first.id}"

      merchant_info = [JSON.parse(response.body)]
      merchant_1  = merchant_info.first

      expect(response).to be_success
      expect(merchant_info.count).to eq(1)
      expect(merchant_1).to be_a(Hash)
      expect(merchant_1).to have_key("id")
      expect(merchant_1).to have_key("name")
      expect(merchant_1["name"]).to be_a(String)
      expect(merchant_1["id"]).to be_a(Integer)
    end

    it "returns a single merchant when given a created_at" do
      merchant = create_list(:merchant, 3)


      get "/api/v1/merchants/find?#{merchant.first.created_at}"

      merchant_info = [JSON.parse(response.body)]
      merchant_1  = merchant_info.first


      expect(response).to be_success
      expect(merchant_info.count).to eq(1)
      expect(merchant_1).to be_a(Hash)
      expect(merchant_1).to have_key("id")
      expect(merchant_1).to have_key("name")
      expect(merchant_1["name"]).to be_a(String)
      expect(merchant_1["id"]).to be_a(Integer)
    end

    it "returns a single merchant when given a updated_at" do
      merchant = create_list(:merchant, 3)


      get "/api/v1/merchants/find?#{merchant.first.updated_at}"

      merchant_info = [JSON.parse(response.body)]
      merchant_1  = merchant_info.first


      expect(response).to be_success
      expect(merchant_info.count).to eq(1)
      expect(merchant_1).to be_a(Hash)
      expect(merchant_1).to have_key("id")
      expect(merchant_1).to have_key("name")
      expect(merchant_1["name"]).to be_a(String)
      expect(merchant_1["id"]).to be_a(Integer)
    end

    it "returns a single merchant when given a name" do
      merchant = create_list(:merchant, 3)

      get "/api/v1/merchants/find?#{merchant.first.name}"

      merchant_info = [JSON.parse(response.body)]
      merchant_1  = merchant_info.first


      expect(response).to be_success
      expect(merchant_info.count).to eq(1)
      expect(merchant_1).to be_a(Hash)
      expect(merchant_1).to have_key("id")
      expect(merchant_1).to have_key("name")
      expect(merchant_1["name"]).to be_a(String)
      expect(merchant_1["id"]).to be_a(Integer)
    end
  end
end
