require 'rails_helper'

describe "Merchants API" do
  it "returns a list of merchants" do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

    merchants = JSON.parse(response.body)
    merchant  = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(13)
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

  context "returns several merchants" do
    it "when given a created_at" do
      merchant = create_list(:merchant, 3)

      get "/api/v1/merchants/find_all?#{merchant.first.created_at}"

      merchant_info = [JSON.parse(response.body)]
      expect(response).to be_success
    end
  end

  context "get a merchant's favorite customer" do
    it "returns a merchant's favorite customer" do
      create_list(:merchant, 3)
      create_list(:customer, 2)
      create_list(:invoice, 2, customer_id: Customer.first.id, merchant_id: Merchant.first.id)
      create_list(:transaction, 3, invoice_id: Invoice.first.id)
      create(:invoice, customer_id: Customer.first.id, merchant_id: Merchant.last.id)

      get "/api/v1/merchants/#{Merchant.first.id}/favorite_customer"

      favorite_merchant = JSON.parse(response.body)

      expect(favorite_merchant["id"]).to eq(Customer.first["id"])
      expect(response).to be_success
    end
  end

  context "get a variable amount of the top merchant revenue" do
    it "returns the top merchant revenue" do
      create_list(:merchant, 3)
      create_list(:customer, 2)
      create_list(:invoice, 2, customer_id: Customer.first.id, merchant_id: Merchant.first.id)
      create_list(:invoice, 5, customer_id: Customer.first.id, merchant_id: Merchant.second.id)
      create_list(:transaction, 3, invoice_id: Invoice.first.id)
      create(:invoice, customer_id: Customer.first.id, merchant_id: Merchant.last.id)

      get "/api/v1/merchants/most_revenue?quantity=2"

      merchant_revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_revenue.count).to eq(2)
      expect(merchant_revenue.first["name"]).to eq(Merchant.second.name)
    end
  end

  context "returns a random merchant" do
    it "can find a merchant by name" do

    get '/api/v1/merchants/random'

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
    expect(merchant["name"]).to be_a(String)
  end

  end

  context 'GET top merchants' do
    it 'returns top merchant by number of items sold' do
      create_list(:merchant, 4)
      create_list(:customer, 2)
      create_list(:item, 2)
      create(:invoice, merchant_id: Merchant.first.id, customer_id: Customer.first.id)
      create(:invoice, merchant_id: Merchant.first.id, customer_id: Customer.last.id)
      create(:transaction, invoice_id: Invoice.first.id)
      create(:invoice_item, item_id: Item.first.id, quantity: 16)
      create(:invoice_item, item_id: Item.second.id, quantity:4)
      create(:transaction, invoice_id: Invoice.second.id)

      get '/api/v1/merchants/most_items?quantity=2'

      top_merchants = JSON.parse(response.body)

      expect(response).to be_success
    end
  end
end
