require 'rails_helper'

describe "Invoice-Invoice_Items Relationship API" do
  context "HTTP GET" do
    it "returns all invoice_items associated to single Invoice" do
      invoice = create(:invoice)

      create(:invoice_item, invoice: invoice)
      create(:invoice_item, invoice: invoice)
      create(:invoice_item, invoice: invoice)

      get "/api/v1/invoices/#{invoice.id}/invoice_items"

      expect(response).to be_success

      invoice_items = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_items.count).to eq(3)
    end
  end
end
