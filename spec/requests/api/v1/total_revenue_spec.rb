require 'rails_helper'

describe "Total Revenue Controller" do
  it "calculates the expected total revenue" do
    create_list(:merchant, 3)
    create_list(:customer, 2)
    create_list(:invoice, 2, customer_id: Customer.first.id, merchant_id: Merchant.first.id)
    create_list(:invoice, 5, customer_id: Customer.first.id, merchant_id: Merchant.second.id)
    create_list(:transaction, 3, invoice_id: Invoice.first.id)
    create(:invoice, customer_id: Customer.first.id, merchant_id: Merchant.last.id)

    merchant = Merchant.first
    date = merchant.invoices.first.created_at
    total_revenue = merchant.get_revenue(date)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date}"
    revenue_info = [JSON.parse(response.body)]

    expect(status).to be(200)
    expect(revenue_info.class).to be(Array)
  end

  it "calculates the expected total revenue for a given date" do
  create_list(:merchant, 3)
  create_list(:customer, 2)
  create_list(:invoice, 2, customer_id: Customer.first.id, merchant_id: Merchant.first.id)
  create_list(:invoice, 5, customer_id: Customer.first.id, merchant_id: Merchant.second.id)
  create_list(:transaction, 3, invoice_id: Invoice.first.id)
  create(:invoice, customer_id: Customer.first.id, merchant_id: Merchant.last.id)

  merchant = Merchant.first
  date = merchant.invoices.first.created_at
  total_revenue = merchant.get_revenue(date)

  get "/api/v1/merchants/revenue"
  revenue_info = [JSON.parse(response.body)]

  expect(status).to be(200)
  expect(revenue_info.class).to be(Array)
end
end
