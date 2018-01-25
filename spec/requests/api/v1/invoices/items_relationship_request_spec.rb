require 'rails_helper'

describe "Invoice-Items Relationship API" do
  context "HTTP GET" do
    it "returns all items associated to single Invoice" do
      invoice = create(:invoice)

      item1 = create(:item)
      item2 = create(:item)
      item3 = create(:item)

      create(:invoice_item, invoice: invoice, item: item1)
      create(:invoice_item, invoice: invoice, item: item2)
      create(:invoice_item, invoice: invoice, item: item3)

      get "/api/v1/invoices/#{invoice.id}/items"

      expect(response).to be_success

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items.count).to eq(3)
    end
  end
end
