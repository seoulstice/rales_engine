require 'rails_helper'

describe "Invoice Transactions Relationship API" do
  context "HTTP GET" do
    it "returns all transactions associated to single Invoice" do
      invoice = create(:invoice)

      create_list(:transaction, 5, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/transactions"

      expect(response).to be_success

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions.count).to eq(5)
    end
  end
end
