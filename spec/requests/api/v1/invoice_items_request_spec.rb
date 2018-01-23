require "rails_helper"

describe "Invoice Items API" do
  context "HTTP GET" do
    it "returns all invoice items" do
      merchant = create(:merchant)
      customer = create(:customer)
      item = create(:item, merchant: merchant)
      invoice = create(:invoice, merchant: merchant, customer:customer)
      create(:invoice_item, item: item, invoice: invoice)
      create(:invoice_item, item: item, invoice: invoice)

      get "/api/v1/invoice_items"

      expect(response).to be_success

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(2)
    end
    it "returns an invoice item by id" do
      merchant = create(:merchant)
      customer = create(:customer)
      item = create(:item, merchant: merchant)
      invoice = create(:invoice, merchant: merchant, customer:customer)
      id = create(:invoice_item, item: item, invoice: invoice).id

      get "/api/v1/invoice_items/#{id}"

      expect(response).to be_success

      invoice_item = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_item[:id]).to eq(id)
    end
  end
end
