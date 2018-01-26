require 'rails_helper'

require 'rails_helper'

describe "Item-Merchant Relationship API" do
  context "HTTP GET" do
    it "returns a merchant associated to item" do
      merchant = create(:merchant, name: "John Doe")
      item = create(:item, merchant: merchant)

      get "/api/v1/items/#{item.id}/merchant"

      expect(response).to be_success

      merchant1 = JSON.parse(response.body, symbolize_names: true)

      expect(merchant1[:id]).to eq(merchant.id)
      expect(merchant1[:name]).to eq("John Doe")
    end
  end
end
