require 'rails_helper'

describe "Merchant Items API" do
  context "HTTP GET" do
    it "returns items for a merchant" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      item1 = create(:item, merchant: merchant1)
      item2 = create(:item, merchant: merchant1)
      item3 = create(:item, merchant: merchant2)

      get "/api/v1/merchants/#{merchant1.id}/items"

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[0][:id]).to eq(item1.id)
      expect(items[1][:id]).to eq(item2.id)
    end
  end
end
