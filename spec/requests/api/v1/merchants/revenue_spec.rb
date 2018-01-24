require 'rails_helper'

describe "Merchants API" do
  context "HTTP GET" do
    it "returns the revenue for a single merchant" do
      merchant1 = create(:merchant)
      invoice = create(:invoice, merchant: merchant1)
      create(:invoice_item, invoice: invoice, quantity: 1, unit_price: 100)
      create(:transaction, invoice: invoice, result: "success")

      get "/api/v1/merchants/#{merchant1.id}/revenue"

      expect(response).to be_successful
      merchant = JSON.parse(response.body, symbolize_names: true)
      expect(merchant[:id]).to eq(merchant1.id)
      expect(merchant[:revenue]).to eq("1.0")
    end
  end
end
