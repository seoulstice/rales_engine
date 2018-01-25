require 'rails_helper'

describe "Invoice-Merchant Relationship API" do
  context "HTTP GET" do
    it "returns a Merchant associated to single Invoice" do
      merchant = create(:merchant, name: "John Doe")
      invoice = create(:invoice, merchant: merchant)

      get "/api/v1/invoices/#{invoice.id}/merchant"

      expect(response).to be_success

      merchant1 = JSON.parse(response.body, symbolize_names: true)

      expect(merchant1[:name]).to eq("John Doe")
      expect(merchant1[:id]).to eq(merchant.id)

    end
  end
end
