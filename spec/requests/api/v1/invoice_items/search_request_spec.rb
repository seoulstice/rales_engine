require 'rails_helper'

describe "Invoice items Search API" do
  context "HTTP GET" do
    it "returns single invoice_item by item_id parameter" do
      invoice_item = create(:invoice_item)
      invoice_item2 = create(:invoice_item)

      get "/api/v1/invoice_items/find?name=#{invoice_item.item_id}"

      expect(response).to be_success

      invoice_item_response = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item_response[:id]).to eq(invoice_item.id)
    end
    it "returns single invoice_item by update_at parameter" do
      invoice_item = create(:invoice_item)
      invoice_item2 = create(:invoice_item)

      get "/api/v1/invoice_items/find?created_at=#{invoice_item.updated_at}"

      expect(response).to be_success

      invoice_item_response = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item_response[:id]).to eq(invoice_item.id)
    end
    it "returns all invoice_items by name parameter" do
      invoice_item = create(:invoice_item)
      invoice_item2 = create(:invoice_item)

      get "/api/v1/invoice_items/find_all?name=#{invoice_item.quantity}"

      expect(response).to be_success

      invoice_item_response = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item_response[0][:id]).to eq(invoice_item.id)
      expect(invoice_item_response[1][:id]).to eq(invoice_item2.id)
    end
  end
end
