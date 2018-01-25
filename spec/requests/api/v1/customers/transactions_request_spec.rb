require 'rails_helper'

describe "Customer Transactions API" do
  context "HTTP GET" do
    it "returns transactions for a customer" do
      customer1 = create(:customer)
      customer2 = create(:customer)
      invoice1 = create(:invoice, customer: customer1)
      invoice2 = create(:invoice, customer: customer2)
      invoice3 = create(:invoice, customer: customer2)
      transaction1 = create(:transaction, invoice: invoice1)
      transaction2 = create(:transaction, invoice: invoice2)
      transaction3 = create(:transaction, invoice: invoice3)

      get "/api/v1/customers/#{customer2.id}/transactions"

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions[0][:id]).to eq(transaction2.id)
      expect(transactions[1][:id]).to eq(transaction3.id)
    end
  end
end
