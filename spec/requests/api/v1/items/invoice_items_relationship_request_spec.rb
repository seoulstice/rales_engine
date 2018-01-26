require 'rails_helper'

describe "Item-Invoice_Items Relationship API" do
  context "HTTP GET" do
    it "returns a collection of invoice items associated to item" do
      item = create(:item)

      create(:invoice_item, item: item)
      create(:invoice_item, item: item)
      create(:invoice_item, item: item)
      create(:invoice_item, item: item)

      get "/api/v1/items/#{item.id}/invoice_items"

      expect(response).to be_success

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_items.count).to eq(4)
    end
  end
end
