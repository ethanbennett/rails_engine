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

  it "returns a single transaction " do
    transaction = create(:transaction)


    get "/api/v1/transactions/#{transaction.id}"

    transaction_info = [JSON.parse(response.body)]
    transaction_1  = transaction_info.first


    expect(response).to be_success
    expect(transaction_info.count).to eq(1)
    expect(transaction_1).to be_a(Hash)
    expect(transaction_1).to have_key("id")
    expect(transaction_1).to have_key("result")
    expect(transaction_1).to have_key("credit_card_number")
    expect(transaction_1["result"]).to be_a(String)
    expect(transaction_1["credit_card_number"]).to be_a(String)
    expect(transaction_1["id"]).to be_a(Integer)
  end

  context "returns a single transaction" do
    it "returns a single transaction when given an id number" do
      transaction = create_list(:transaction, 3)


      get "/api/v1/transactions/find?#{transaction.first.id}"

      transaction_info = [JSON.parse(response.body)]
      transaction_1  = transaction_info.first

      expect(response).to be_success
      expect(transaction_info.count).to eq(1)
      expect(transaction_1).to be_a(Hash)
      expect(transaction_1).to have_key("id")
      expect(transaction_1).to have_key("result")
      expect(transaction_1).to have_key("credit_card_number")
      expect(transaction_1["result"]).to be_a(String)
      expect(transaction_1["credit_card_number"]).to be_a(String)
      expect(transaction_1["id"]).to be_a(Integer)
    end

    it "returns a single transaction when given a created_at" do
      transaction = create_list(:transaction, 3)


      get "/api/v1/transactions/find?#{transaction.first.created_at}"

      transaction_info = [JSON.parse(response.body)]
      transaction_1  = transaction_info.first


      expect(response).to be_success
      expect(transaction_info.count).to eq(1)
      expect(transaction_1).to be_a(Hash)
      expect(transaction_1).to have_key("id")
      expect(transaction_1).to have_key("result")
      expect(transaction_1).to have_key("credit_card_number")
      expect(transaction_1["result"]).to be_a(String)
      expect(transaction_1["credit_card_number"]).to be_a(String)
      expect(transaction_1["id"]).to be_a(Integer)
    end

    it "returns a single transaction when given a updated_at" do
      transaction = create_list(:transaction, 3)


      get "/api/v1/transactions/find?#{transaction.first.updated_at}"

      transaction_info = [JSON.parse(response.body)]
      transaction_1  = transaction_info.first


      expect(response).to be_success
      expect(transaction_info.count).to eq(1)
      expect(transaction_1).to be_a(Hash)
      expect(transaction_1).to have_key("id")
      expect(transaction_1).to have_key("result")
      expect(transaction_1).to have_key("credit_card_number")
      expect(transaction_1["result"]).to be_a(String)
      expect(transaction_1["credit_card_number"]).to be_a(String)
      expect(transaction_1["id"]).to be_a(Integer)
    end

    it "returns a single transaction when given a credit card number" do
      transaction = create_list(:transaction, 3)


      get "/api/v1/transactions/find?#{transaction.first.credit_card_number}"

      transaction_info = [JSON.parse(response.body)]
      transaction_1  = transaction_info.first


      expect(response).to be_success
      expect(transaction_info.count).to eq(1)
      expect(transaction_1).to be_a(Hash)
      expect(transaction_1).to have_key("id")
      expect(transaction_1).to have_key("result")
      expect(transaction_1).to have_key("credit_card_number")
      expect(transaction_1["result"]).to be_a(String)
      expect(transaction_1["credit_card_number"]).to be_a(String)
      expect(transaction_1["id"]).to be_a(Integer)
    end

    it "returns a single transaction when given a result" do
      transaction = create_list(:transaction, 3)


      get "/api/v1/transactions/find?#{transaction.first.result}"

      transaction_info = [JSON.parse(response.body)]
      transaction_1  = transaction_info.first


      expect(response).to be_success
      expect(transaction_info.count).to eq(1)
      expect(transaction_1).to be_a(Hash)
      expect(transaction_1).to have_key("id")
      expect(transaction_1).to have_key("result")
      expect(transaction_1).to have_key("credit_card_number")
      expect(transaction_1["result"]).to be_a(String)
      expect(transaction_1["credit_card_number"]).to be_a(String)
      expect(transaction_1["id"]).to be_a(Integer)
    end
  end
end
