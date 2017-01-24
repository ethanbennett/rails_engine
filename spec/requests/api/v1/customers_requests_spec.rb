require 'rails_helper'

describe "Customers API" do
  it "returns a list of customers" do
    create_list(:customer, 3)

    get "/api/v1/customers"

    customers = JSON.parse(response.body)
    customer  = customers.first

    expect(response).to be_success
    expect(customers.count).to eq(3)
    expect(customer).to be_a(Hash)
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
    expect(customer["first_name"]).to be_a(String)
    expect(customer["last_name"]).to be_a(String)
    expect(customer["id"]).to be_a(Integer)
  end

  it "returns a single customer" do
    customer = create(:customer)


    get "/api/v1/customers/#{customer.id}"

    customer_info = [JSON.parse(response.body)]
    customer_1  = customer_info.first


    expect(response).to be_success
    expect(customer_info.count).to eq(1)
    expect(customer_1).to be_a(Hash)
    expect(customer_1).to have_key("id")
    expect(customer_1).to have_key("first_name")
    expect(customer_1).to have_key("last_name")
    expect(customer_1["first_name"]).to be_a(String)
    expect(customer_1["last_name"]).to be_a(String)
    expect(customer_1["id"]).to be_a(Integer)
  end
end
