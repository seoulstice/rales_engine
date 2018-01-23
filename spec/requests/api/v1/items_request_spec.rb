require 'rails_helper'

describe "Items API" do
  context "HTTP GET" do
    it "sends a list of items" do
      merchant = create(:merchant)
      create(:item, merchant: merchant)
      create(:item, merchant: merchant)
      create(:item, merchant: merchant)

      get '/api/v1/items'

      expect(response).to be_success

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
    end
    it "can get one item by its id" do
      merchant = create(:merchant)
      id = create(:item, merchant: merchant).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(item[:id]).to eq(id)
    end
  end
end
