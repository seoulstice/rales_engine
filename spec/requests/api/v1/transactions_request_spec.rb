require 'rails_helper'

describe "Transactions API" do
  context "HTTP GET" do
    it "returns all transactions" do
      create_list(:transaction, 3)

      get '/api/v1/transactions'

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
    end

    it "returns one transaction" do
      id = create(:transaction).id

      get "/api/v1/transactions/#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item["id"]).to eq(id)
    end
  end
end
