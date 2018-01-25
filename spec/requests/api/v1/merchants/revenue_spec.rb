require 'rails_helper'

describe "Merchants API" do
  context "HTTP GET" do
    before :each do
      merchant1 = create(:merchant)
      invoice1 = create(:invoice, merchant: merchant1, created_at: "2012-03-09 01:54:10 UTC" )
      invoice2 = create(:invoice, merchant: merchant1, created_at: "2012-03-09 01:54:10 UTC")
      create(:invoice_item, invoice: invoice1, quantity: 1, unit_price: 100)
      create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 100)
      create(:transaction, invoice: invoice1, result: "success")
      create(:transaction, invoice: invoice2, result: "failed")
    end

    it "returns the revenue for a single merchant" do

      get "/api/v1/merchants/#{merchant1.id}/revenue"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:revenue]).to eq("1.00")
    end

    it "returns the total revenue for a merchant by invoice date" do

      get "/api/v1/merchants/#{merchant1.id}/revenue?date='2012-03-09 01:54:10 UTC'"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:revenue]).to eq("1.00")
    end
  end
end
