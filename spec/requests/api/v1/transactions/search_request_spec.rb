require 'rails_helper'

describe "Transactions API" do
  context "HTTP GET with ID Query" do
    it "returns single Transaction by ID search" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction)
      # binding.pry
      get "/api/v1/transactions/find?id=#{transaction1.id}"

      expect(response).to be_successful

      transaction = JSON.parse(response.body, symbolize_names: true)

      expect(transaction[:id]).to eq(transaction1.id)
    end

    it "returns multiple Transactions by ID search" do
      transaction1, transaction2, transaction3, transaction4 = create_list(:transaction, 4)
      # binding.pry
      get "/api/v1/transactions/find_all?id=#{transaction1.id}"

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions.count).to eq(1)
      expect(transactions.class).to eq(Array)
    end
  end
end
