require 'rails_helper'

describe "Invoice_Item-Item Relationship API" do
  context "HTTP GET" do
    it "returns item associated to invoice_item" do
      item = create(:item, name: "Toy Car")
      invoice_item = create(:invoice_item, item: item)

      get "/api/v1/invoice_items/#{invoice_item.id}/item"

      expect(response).to be_success

      item1 = JSON.parse(response.body, symbolize_names: true)

      expect(item1[:id]).to eq(item.id)
      expect(item1[:name]).to eq("Toy Car")
    end
  end
end
