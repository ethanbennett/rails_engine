require 'rails_helper'

describe "Invoices API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    get "/api/v1/invoices"
    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key("id")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("status")
  end

  it "returns a single invoice" do
    invoice = create(:invoice)


    get "/api/v1/invoices/#{invoice.id}"

    invoice_info = [JSON.parse(response.body)]
    invoice_1  = invoice_info.first


    expect(response).to be_success
    expect(invoice_info.count).to eq(1)
    expect(invoice_1).to be_a(Hash)
    expect(invoice_1).to have_key("id")
    expect(invoice_1).to have_key("name")
    expect(invoice_1).to have_key("description")
    expect(invoice_1).to have_key("unit_price")
    expect(invoice_1).to have_key("merchant_id")
    expect(invoice_1["description"]).to be_a(String)
    expect(invoice_1["unit_price"]).to be_a(Integer)
    expect(invoice_1["name"]).to be_a(String)
    expect(invoice_1["id"]).to be_a(Integer)
  end

  context "returns a single invoice" do
    it "returns a single invoice when given an id number" do
      invoice = create_list(:invoice, 3)


      get "/api/v1/invoices/find?#{invoice.first.id}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first

      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("name")
      expect(invoice_1).to have_key("description")
      expect(invoice_1).to have_key("unit_price")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["description"]).to be_a(String)
      expect(invoice_1["unit_price"]).to be_a(Integer)
      expect(invoice_1["name"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice when given a created_at" do
      invoice = create_list(:invoice, 3)


      get "/api/v1/invoices/find?#{invoice.first.created_at}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first


      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("name")
      expect(invoice_1).to have_key("description")
      expect(invoice_1).to have_key("unit_price")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["description"]).to be_a(String)
      expect(invoice_1["unit_price"]).to be_a(Integer)
      expect(invoice_1["name"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice when given a updated_at" do
      invoice = create_list(:invoice, 3)


      get "/api/v1/invoices/find?#{invoice.first.updated_at}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first


      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("name")
      expect(invoice_1).to have_key("description")
      expect(invoice_1).to have_key("unit_price")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["description"]).to be_a(String)
      expect(invoice_1["unit_price"]).to be_a(Integer)
      expect(invoice_1["name"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice when given a name" do
      invoice = create_list(:invoice, 3)

      get "/api/v1/invoices/find?#{invoice.first.name}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first


      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("name")
      expect(invoice_1).to have_key("description")
      expect(invoice_1).to have_key("unit_price")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["description"]).to be_a(String)
      expect(invoice_1["unit_price"]).to be_a(Integer)
      expect(invoice_1["name"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice when given a description" do
      invoice = create_list(:invoice, 3)

      get "/api/v1/invoices/find?#{invoice.first.description}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first


      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("name")
      expect(invoice_1).to have_key("description")
      expect(invoice_1).to have_key("unit_price")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["description"]).to be_a(String)
      expect(invoice_1["unit_price"]).to be_a(Integer)
      expect(invoice_1["name"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice when given a unit_price" do
      invoice = create_list(:invoice, 3)

      get "/api/v1/invoices/find?#{invoice.first.unit_price}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first


      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("name")
      expect(invoice_1).to have_key("description")
      expect(invoice_1).to have_key("unit_price")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["description"]).to be_a(String)
      expect(invoice_1["unit_price"]).to be_a(Integer)
      expect(invoice_1["name"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice when given a merchant_id" do
      invoice = create_list(:invoice, 3)

      get "/api/v1/invoices/find?#{invoice.first.merchant_id}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first


      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("name")
      expect(invoice_1).to have_key("description")
      expect(invoice_1).to have_key("unit_price")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["description"]).to be_a(String)
      expect(invoice_1["unit_price"]).to be_a(Integer)
      expect(invoice_1["name"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end
  end
end
