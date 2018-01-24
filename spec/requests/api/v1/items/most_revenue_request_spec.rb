require 'rails_helper'

describe "Most Revenue API" do
  context "HTTP GET" do
    it "returns x quantity of items by top revenue generated" do
      item = create(:item)
      item2 = create(:item)
      item3 = create(:item)
      create(:invoice_item, item: item)
      create(:invoice_item, item: item)
      create(:invoice_item, item: item)
      create(:invoice_item, item: item3)
      create(:invoice_item, item: item3)
      create(:invoice_item, item: item2)

      get "/api/v1/items/most_revenue?quantity=2"

      expect(response).to be_success

      response1 = JSON.parse(response.body, symbolize_names: true)

      expect(response1.class).to eq(Array)
      expect(response1[0][:id]).to eq(item.id)
      expect(response1[1][:id]).to eq(item3.id)
    end
  end
end
