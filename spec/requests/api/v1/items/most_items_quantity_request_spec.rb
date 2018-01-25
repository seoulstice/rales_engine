require 'rails_helper'

describe "Items API" do
  context "HTTP Get for most items" do
    it "returns the top items by number sold" do
      item1 = create(:item)
      item2 = create(:item)
      item3 = create(:item)

      create(:invoice_item, item: item1, quantity: 4)
      create(:invoice_item, item: item1, quantity: 4)
      create(:invoice_item, item: item2, quantity: 2)
      create(:invoice_item, item: item2, quantity: 2)
      create(:invoice_item, item: item3, quantity: 1)
      create(:invoice_item, item: item3, quantity: 1)

      get '/api/v1/items/most_items?quantity=2'

      expect(response).to be_success

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.class).to eq(Array)
      expect(items[0][:id]).to eq(item1.id)
      expect(items[1][:id]).to eq(item2.id)
    end
  end
end
