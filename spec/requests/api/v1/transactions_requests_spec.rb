require 'rails_helper'

describe "Transactions API" do
  it "returns a list of transactions" do
    create_list(:transaction, 3)

    get "/api/v1/transactions"

    transactions = JSON.parse(response.body)
    transaction  = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transaction).to be_a(Hash)
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("result")
    expect(transaction["credit_card_number"]).to be_a(String)
    expect(transaction["result"]).to be_a(String)
    expect(transaction["id"]).to be_a(Integer)
  end
end
