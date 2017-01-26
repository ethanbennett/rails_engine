require 'rails_helper'

describe "Invoices API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    get "/api/v1/invoices"
    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(6)
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
    expect(invoice_1).to have_key("customer_id")
    expect(invoice_1).to have_key("merchant_id")
    expect(invoice_1).to have_key("merchant_id")
    expect(invoice_1["customer_id"]).to be_a(Integer)
    expect(invoice_1["merchant_id"]).to be_a(Integer)
    expect(invoice_1["status"]).to be_a(String)
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
      expect(invoice_1).to have_key("customer_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["customer_id"]).to be_a(Integer)
      expect(invoice_1["merchant_id"]).to be_a(Integer)
      expect(invoice_1["status"]).to be_a(String)
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
      expect(invoice_1).to have_key("customer_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["customer_id"]).to be_a(Integer)
      expect(invoice_1["merchant_id"]).to be_a(Integer)
      expect(invoice_1["status"]).to be_a(String)
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
      expect(invoice_1).to have_key("customer_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["customer_id"]).to be_a(Integer)
      expect(invoice_1["merchant_id"]).to be_a(Integer)
      expect(invoice_1["status"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end

    it "returns a single invoice when given a status" do
      invoice = create_list(:invoice, 3)

      get "/api/v1/invoices/find?#{invoice.first.status}"

      invoice_info = [JSON.parse(response.body)]
      invoice_1  = invoice_info.first


      expect(response).to be_success
      expect(invoice_info.count).to eq(1)
      expect(invoice_1).to be_a(Hash)
      expect(invoice_1).to have_key("id")
      expect(invoice_1).to have_key("customer_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1).to have_key("merchant_id")
      expect(invoice_1["customer_id"]).to be_a(Integer)
      expect(invoice_1["merchant_id"]).to be_a(Integer)
      expect(invoice_1["status"]).to be_a(String)
      expect(invoice_1["id"]).to be_a(Integer)
    end
  end
end
