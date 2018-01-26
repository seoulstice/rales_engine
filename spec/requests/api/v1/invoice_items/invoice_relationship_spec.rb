require 'rails_helper'

describe "Invoice_Item-Invoice Relationship API" do
  context "HTTP GET" do
    it "returns invoice associated to invoice_item" do
      invoice = create(:invoice)
      invoice_item = create(:invoice_item, invoice: invoice)

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      expect(response).to be_success

      invoice1 = JSON.parse(response.body, symbolize_names: true)

      expect(invoice1[:id]).to eq(invoice.id)
    end
  end
end
