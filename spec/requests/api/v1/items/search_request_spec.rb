require 'rails_helper'

describe "Item Search API" do
  context "HTTP GET" do
    it "returns single item by name parameter" do
      item = create(:item)
      item2 = create(:item)

      get "/api/v1/items/find?name=#{item.name}"

      expect(response).to be_success

      item_response = JSON.parse(response.body, symbolize_names: true)

      expect(item_response[:id]).to eq(item.id)
    end
    it "returns single item by created_at parameter" do
      item = create(:item)
      item2 = create(:item)

      get "/api/v1/items/find?created_at=#{item.created_at}"

      expect(response).to be_success

      item_response = JSON.parse(response.body, symbolize_names: true)

      expect(item_response[:id]).to eq(item.id)
    end
    it "returns all item by name parameter" do
      item = create(:item)
      item2 = create(:item)

      get "/api/v1/items/find_all?name=#{item.name}"

      expect(response).to be_success

      item_response = JSON.parse(response.body, symbolize_names: true)

      expect(item_response[0][:id]).to eq(item.id)
      expect(item_response[1][:id]).to eq(item2.id)
    end
  end
end
